#
# Print parameters
#
import pybamm
from collections import defaultdict

# Set list of attributes to ignore, for when we are evaluating parameters from a class
# of parameters
ignore = [
    "__name__",
    "__doc__",
    "__package__",
    "__loader__",
    "__spec__",
    "__file__",
    "__cached__",
    "__builtins__",
    "absolute_import",
    "division",
    "print_function",
    "unicode_literals",
    "pybamm",
    "constants",
]


def print_parameters(parameters, parameter_values, output_file=None):
    """
    Return dictionary of evaluated parameters, and optionally print these evaluated
    parameters to an output file.
    For dimensionless parameters that depend on the C-rate, the value is given as a
    function of the C-rate (either x * Crate or x / Crate depending on the dependence)

    Parameters
    ----------
    parameters : class or dict containing :class:`pybamm.Parameter` objects
        Class or dictionary containing all the parameters to be evaluated
    parameter_values : :class:`pybamm.ParameterValues`
        The class of parameter values
    output_file : string, optional
        The file to print parameters to. If None, the parameters are not printed, and
        this function simply acts as a test that all the parameters can be evaluated,
        and returns the dictionary of evaluated parameters.

    Returns
    -------
    evaluated_parameters : defaultdict
        The evaluated parameters, for further processing if needed

    Notes
    -----
    A C-rate of 1 C is the current required to fully discharge the battery in 1 hour,
    2 C is current to discharge to the battery in 0.5 hours, etc
    """
    # If 'parameters' is a class, extract the dict
    if not isinstance(parameters, dict):
        parameters = {k: v for k, v in parameters.__dict__.items() if k not in ignore}

    evaluated_parameters = defaultdict(list)
    # Calculate the currents required for C-rates of 1C and C / 10
    try:
        current_for_1C = parameter_values["Cell capacity [A.h]"]
    except KeyError:
        current_for_1C = 1
    current_for_C_over_10 = current_for_1C / 10
    # Calculate parameters for each C-rate
    for current in [current_for_1C, current_for_C_over_10]:
        # Update Crate
        parameter_values.update({"Typical current [A]": current})
        for name, symbol in parameters.items():
            if not callable(symbol):
                proc_symbol = parameter_values.process_symbol(symbol)
                if not (
                    callable(proc_symbol)
                    or isinstance(proc_symbol, pybamm.Concatenation)
                ):
                    evaluated_parameters[name].append(proc_symbol.evaluate(t=0))

    # Calculate C-dependence of the parameters based on the difference between the
    # value at 1C and the value at C / 10
    for name, values in evaluated_parameters.items():
        if abs(values[0] - values[1]) < 1e-9:
            C_dependence = ""
        elif abs(values[0] - 10 * values[1]) < 1e-9:
            C_dependence = " * Crate"
        elif abs(10 * values[0] - values[1]) < 1e-9:
            C_dependence = " / Crate"
        evaluated_parameters[name] = (values[0], C_dependence)

    # Print the evaluated_parameters dict to output_file
    if output_file:
        print_evaluated_parameters(evaluated_parameters, output_file)

    return evaluated_parameters


def print_evaluated_parameters(evaluated_parameters, output_file):
    """
    Print a dictionary of evaluated parameters to an output file

    Parameters
    ----------
    evaluated_parameters : defaultdict
        The evaluated parameters, for further processing if needed
    output_file : string, optional
        The file to print parameters to. If None, the parameters are not printed, and
        this function simply acts as a test that all the parameters can be evaluated

    """
    # Get column width for pretty printing
    column_width = max(len(name) for name in evaluated_parameters.keys())
    s = "{{:>{}}}".format(column_width)
    with open(output_file, "w") as file:
        for name, (value, C_dependence) in sorted(evaluated_parameters.items()):
            if 0.001 < abs(value) < 1000:
                file.write((s + " : {:10.4g}{!s}\n").format(name, value, C_dependence))
            else:
                file.write((s + " : {:10.3E}{!s}\n").format(name, value, C_dependence))

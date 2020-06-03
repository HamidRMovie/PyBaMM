#
# Solver class using Scipy's adaptive time stepper
#
import pybamm

import jax
from jax.experimental.ode import odeint
import jax.numpy as np
import numpy as onp


class JaxSolver(pybamm.BaseSolver):
    """Solve a discretised model, using jax.experimental.odeint.

    Parameters
    ----------
    rtol : float, optional
        The relative tolerance for the solver (default is 1e-6).
    atol : float, optional
        The absolute tolerance for the solver (default is 1e-6).
    extra_options : dict, optional
        Any options to pass to the solver.
        Please consult `SciPy documentation <https://tinyurl.com/yafgqg9y>`_ for
        details.
    """

    def __init__(self, rtol=1e-6, atol=1e-6, extra_options=None):
        super().__init__(rtol, atol)
        self.ode_solver = True
        self.extra_options = extra_options or {}
        self.name = "JAX solver"
        self._cached_solves = dict()

    def get_solve(self, model, t_eval):
        if model not in self._cached_solves:
            if model not in self.models_set_up:
                raise RuntimeError("Model is not set up for solving, run"
                                   "`solver.solve(model)` first")

            self._cached_solves[model] = self._create_solve(model, t_eval)

        return self._cached_solves[model]

    def _create_solve(self, model, t_eval):
        if model.convert_to_format != "jax":
            raise RuntimeError("Model must be converted to JAX to use this solver"
                               " (i.e. `model.convert_to_format = 'jax')")

        if model.terminate_events_eval:
            raise RuntimeError("Terminate events not supported for this solver."
                               " Model has the following events:"
                               " {}".format(model.events))

        # Initial conditions
        y0 = model.y0

        @jax.jit
        def rhs(y, t, inputs):
            return model.rhs_eval(t, y, inputs)

        @jax.jit
        def solve_model(inputs):
            return np.transpose(
                odeint(
                    rhs,
                    y0,
                    t_eval,
                    inputs,
                    rtol=self.rtol,
                    atol=self.atol,
                    **self.extra_options
                )
            )

        return solve_model

    def _integrate(self, model, t_eval, inputs=None):
        """
        Solve a model defined by dydt with initial conditions y0.

        Parameters
        ----------
        model : :class:`pybamm.BaseModel`
            The model whose solution to calculate.
        t_eval : :class:`numpy.array`, size (k,)
            The times at which to compute the solution
        inputs : dict, optional
            Any input parameters to pass to the model when solving

        Returns
        -------
        object
            An object containing the times and values of the solution, as well as
            various diagnostic messages.

        """
        if model not in self._cached_solves:
            self._cached_solves[model] = self._create_solve(model, t_eval)

        y = self._cached_solves[model](inputs)

        termination = "final time"
        t_event = None
        y_event = onp.array(None)
        return pybamm.Solution(t_eval,
                               jax.numpy.asarray(y),
                               t_event, y_event, termination)

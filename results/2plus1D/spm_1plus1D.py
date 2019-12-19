import pybamm
import numpy as np
import sys

I_app = 0.55

# set logging level
pybamm.set_logging_level("INFO")

# load (1+1D) SPMe model
options = {
    "current collector": "potential pair",
    "dimensionality": 1,
}
model = pybamm.lithium_ion.SPM(options)

# create geometry
geometry = model.default_geometry

# load parameter values and process model and geometry
param = model.default_parameter_values
C_rate = 1
current_1C = 24 * param.process_symbol(pybamm.geometric_parameters.A_cc).evaluate()
param.update(
    {

        "Typical current [A]": I_app,
        "Current function": "[constant]",
        "Initial temperature [K]": 298.15,
        "Negative current collector conductivity [S.m-1]": 1e5,
        "Positive current collector conductivity [S.m-1]": 1e5,
        "Heat transfer coefficient [W.m-2.K-1]": 1,
    }
)
param.process_model(model)
param.process_geometry(geometry)

# set mesh
var = pybamm.standard_spatial_vars
var_pts = {var.x_n: 5, var.x_s: 5, var.x_p: 5, var.r_n: 10, var.r_p: 10, var.z: 10}
# depending on number of points in y-z plane may need to increase recursion depth...
sys.setrecursionlimit(10000)
mesh = pybamm.Mesh(geometry, model.default_submesh_types, var_pts)

# discretise model
disc = pybamm.Discretisation(mesh, model.default_spatial_methods)
disc.process_model(model)

# solve model -- simulate one hour discharge
tau = param.process_symbol(pybamm.standard_parameters_lithium_ion.tau_discharge)
t_end = 3600 / tau.evaluate(0)
t_eval = np.linspace(0, t_end, 120)

solver = pybamm.CasadiSolver(mode="fast")
solution = solver.solve(model, t_eval)

# plot
output_variables = [
     "X-averaged negative particle surface concentration [mol.m-3]",
     "X-averaged positive particle surface concentration [mol.m-3]",
     "Current collector current density [A.m-2]",
     "Terminal voltage [V]",

]
plot = pybamm.QuickPlot(model, mesh, solution, output_variables)
plot.dynamic_plot()

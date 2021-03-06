Field II and KZK Comparison Scripts
===================================

This script uses the functions in `metrics` to compare the 30 mm focal depth Field II and KZK simulations.

#### Linear Simulation Comparison
`linear_compare.m` is a MATLAB script that compares the results of the Field II simulation with the results of the KZK simulation run in linear mode (β = 0). The results of the Field II simulation can be obtained by running the scripts in the `field` folder. They are also located in `/luscinia/nl91/nonlinear_acoustic/field/field_c52_30mm/dyna-I-f2.36-F2.8-FD0.030-a0.45.mat` for the 30 mm focus simulation. The results of the 30 mm linear KZK simulation can be found at `/luscinia/nl91/scratch/c52/focus30mm/quarter_symmetric/c52_intensity_vals_30_qsymm_intensity.mat`.

All intensity values for each simulation were normalized by dividing by the maximum intensity in each field. The KZK intensity field results were quartered in order to be more comparable to the Field II simulations, which were run with the quarter symmetry assumption.

### Maximum Intensity
The maximum intensity for the Field II sim occurred at 0.00 cm in elevation position, 0.00 cm in lateral position, and 3.20 cm in depth position.

The maximum intensity for the linear KZK sim w/ expt. pressure inputs occured at -0.14 cm in elevation position, 0.00 cm in lateral position, and 2.30 cm in depth position. 

The maximum intensity for the linear KZK sim w/ Field II synthesized pressure inputs occured at 0.00 cm in elevation position, 0.00 cm in lateral position, and 3.30 cm in depth position. 

### Center Trace Plot
The center trace plot for the three sims can be seen below.

![Center Trace Plot, Linear KZK and Field II Sims, 30 mm Focus](https://raw.githubusercontent.com/Ningrui-Li/nonlinear_acoustic/master/comparisons/focus30mm/linear_compare/field_kzk_centertrace_c52_30mm.png)

The intensity was plotted with respect to depth for each sim along the 0 cm lateral position and 0 cm elevational position axis. The intensity was then re-normalized along this axis.

### Contour Planes
The contour plane plots for the Field II and KZK sims can be found below in each of the three planes (elevational, lateral, and depth).

##### Elevational Planes
Contour plot slices at elevational positions of -0.14 cm, -0.06 cm, and 0.00 cm can be found below. These planes were chosen because the KZK sim had maximum normalized intensity at an elevational position of -0.14 cm, while the Field II sim had maximum normalized intensity at an elevational position of 0.00 cm.

 * Field II - Elevational Plane Contour Plots

![Elevational Plane Contour Plots, Field II Sim, 30 mm Focus](https://raw.githubusercontent.com/Ningrui-Li/nonlinear_acoustic/master/comparisons/focus30mm/linear_compare/field2_30mm_elevational.png)

 * KZK, Expt. Inputs - Elevational Plane Contour Plots

![Elevational Plane Contour Plots, Linear KZK Sim, Expt. Inputs, 30 mm Focus](https://raw.githubusercontent.com/Ningrui-Li/nonlinear_acoustic/master/comparisons/focus30mm/linear_compare/kzk_30mm_elevational.png)

 * KZK, Field II Inputs - Elevational Plane Contour Plots

![Elevational Plane Contour Plots, Linear KZK Sim, Field II Inputs, 30 mm Focus](https://raw.githubusercontent.com/Ningrui-Li/nonlinear_acoustic/master/comparisons/focus30mm/linear_compare/kzk_f2_input_30mm_elevational.png)


##### Lateral Planes
Contour plot slices at lateral positions of 0.00 cm, 0.08 cm, and 0.16 cm can be found below. These planes were chosen to be around 0.00 cm because both the Field II and KZK sims had maximum normalized intensities at 0.00 cm lateral position.

 * Field II - Lateral Plane Contour Plots

![Lateral Plane Contour Plots, Field II Sim, 30 mm Focus](https://raw.githubusercontent.com/Ningrui-Li/nonlinear_acoustic/master/comparisons/focus30mm/linear_compare/field2_30mm_lateral.png)

 * KZK, Expt. Inputs - Lateral Plane Contour Plots

![Lateral Plane Contour Plots, Linear KZK Sim, Expt. Inputs, 30 mm Focus](https://raw.githubusercontent.com/Ningrui-Li/nonlinear_acoustic/master/comparisons/focus30mm/linear_compare/kzk_30mm_lateral.png)

 * KZK, Field II Inputs - Lateral Plane Contour Plots

![Lateral Plane Contour Plots, Linear KZK Sim, Field II Inputs, 30 mm Focus](https://raw.githubusercontent.com/Ningrui-Li/nonlinear_acoustic/master/comparisons/focus30mm/linear_compare/kzk_f2_input_30mm_lateral.png)

##### Depth Planes
Contour plot slices at depth positions of 2.30 cm, 2.75 cm, and 3.20 cm can be found below. These planes were chosen because the KZK sim had maximum normalized intensity at a depth of 2.30 cm, while the Field II sim had maximum normalized intensity at a depth of 3.20 cm.

 * Field II - Depth Plane Contour Plots

![Depth Plane Contour Plots, Field II Sim, 30 mm Focus](https://raw.githubusercontent.com/Ningrui-Li/nonlinear_acoustic/master/comparisons/focus30mm/linear_compare/field2_30mm_depth.png)

 * KZK, Expt. Inputs - Depth Plane Contour Plots

![Depth Plane Contour Plots, Linear KZK Sim, Expt. Inputs, 30 mm Focus](https://raw.githubusercontent.com/Ningrui-Li/nonlinear_acoustic/master/comparisons/focus30mm/linear_compare/kzk_30mm_depth.png)

 * KZK, Field II Inputs - Depth Plane Contour Plots

![Depth Plane Contour Plots, Linear KZK Sim, Field II Inputs, 30 mm Focus](https://raw.githubusercontent.com/Ningrui-Li/nonlinear_acoustic/master/comparisons/focus30mm/linear_compare/kzk_f2_input_30mm_depth.png)

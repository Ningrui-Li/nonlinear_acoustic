Field II and KZK Comparison Scripts - 70 mm Focus, α = 0.005 dB/cm/MHz
=====================================================================

This script uses the functions in `metrics` to compare the 70 mm focal depth Field II and KZK simulations for an attenuation coefficient of α = 0.005 dB/cm/MHz.

#### Linear Simulation Comparison
`linear_compare.m` is a MATLAB script that compares the results of the Field II simulation with the results of the KZK simulation run in linear mode (β = 0). The results of the Field II simulation can be obtained by running the scripts in the `field` folder. Note that the number of excitation cycles `ncyc` in `dynaField.m` was lowered from 50 cycles to 7 cycles in order to match what was used in the KZK simulations. The 70 mm focal depth simulation can be found at `/luscinia/nl91/nonlinear_acoustic/field/field_c52_70mm/a_0.005/dyna-I-f2.36-F2.8-FD0.070-a0.01.mat`. The results of the 70 mm focus linear KZK simulation with Field II pressure inputs can be found at `/luscinia/nl91/nonlinear_acoustic/kzk/field_ii_c52_focus70mm/B_0/a_0.005_B_0/c52_70mm_intensity_field_field_ii_pressure_input.`. The results of the 70 mm focus linear KZK simulation with experimentally measured pressure inputs can be found at `/luscinia/nl91/scratch/c52/focus30mm/quarter_symmetric/c52_intensity_vals_30_qsymm_intensity.mat`.

All intensity values for each simulation were normalized by dividing by the maximum intensity in each field. The KZK intensity field results were quartered in order to be more comparable to the Field II simulations, which were run with the quarter symmetry assumption.

### Maximum Intensity
The maximum intensity for the Field II sim occurred at 0.00 cm in elevation position, 0.00 cm in lateral position, and 5.10 cm in depth position.

The maximum intensity for the linear KZK sim w/ expt. pressure inputs occured at 0.00 cm in elevation position, 0.00 cm in lateral position, and 6.40 cm in depth position.

The maximum intensity for the linear KZK sim w/ Field II synthesized pressure inputs occured at 0.00 cm in elevation position, 0.00 cm in lateral position, and 5.40 cm in depth position. 

### Center Trace Plot
The center trace plot for the two sims can be seen below.

![Center Trace Plot, Linear KZK and Field II Sims, 70 mm Focus](https://raw.githubusercontent.com/Ningrui-Li/nonlinear_acoustic/master/comparisons/focus70mm/linear_compare/a_0.005/field_kzk_centertrace_c52_70mm.png)

The intensity was plotted with respect to depth for each sim along the 0 cm lateral position and 0 cm elevational position axis. The intensity was then re-normalized along this axis.

### Contour Planes
The contour plane plots for the Field II and KZK sims can be found below in each of the three planes (elevational, lateral, and depth).

##### Elevational Planes
Contour plot slices at elevational positions of -0.14 cm, -0.06 cm, and 0.00 cm can be found below. These planes were chosen to be around 0.00 cm because both the Field II and KZK sims had maximum normalized intensities at 0.00 cm lateral position.

 * Field II - Elevational Plane Contour Plots

![Elevational Plane Contour Plots, Field II Sim, 70 mm Focus](https://raw.githubusercontent.com/Ningrui-Li/nonlinear_acoustic/master/comparisons/focus70mm/linear_compare/a_0.005/field2_70mm_elevational.png)

 * KZK, Expt. Inputs - Elevational Plane Contour Plots

![Elevational Plane Contour Plots, Linear KZK Sim, Expt. Inputs, 70 mm Focus](https://raw.githubusercontent.com/Ningrui-Li/nonlinear_acoustic/master/comparisons/focus70mm/linear_compare/a_0.005/kzk_70mm_elevational.png)

 * KZK, Field II Inputs - Elevational Plane Contour Plots

![Elevational Plane Contour Plots, Linear KZK Sim, Field II Inputs, 30 mm Focus](https://raw.githubusercontent.com/Ningrui-Li/nonlinear_acoustic/master/comparisons/focus70mm/linear_compare/a_0.005/kzk_f2_input_70mm_elevational.png)


##### Lateral Planes
Contour plot slices at lateral positions of 0.00 cm, 0.06 cm, and 0.14 cm can be found below. These planes were chosen because KZK intensity field is maximum in 0.00 cm lateral position plane and Field II intensity field is max in 0.14 cm plane.

 * Field II - Lateral Plane Contour Plots

![Lateral Plane Contour Plots, Field II Sim, 70 mm Focus](https://raw.githubusercontent.com/Ningrui-Li/nonlinear_acoustic/master/comparisons/focus70mm/linear_compare/a_0.005/field2_70mm_lateral.png)

 * KZK, Expt. Inputs - Lateral Plane Contour Plots

![Lateral Plane Contour Plots, Linear KZK Sim, 70 mm Focus](https://raw.githubusercontent.com/Ningrui-Li/nonlinear_acoustic/master/comparisons/focus70mm/linear_compare/a_0.005/kzk_70mm_lateral.png)

 * KZK, Field II Inputs - Lateral Plane Contour Plots

![Lateral Plane Contour Plots, Linear KZK Sim, Field II Inputs, 70 mm Focus](https://raw.githubusercontent.com/Ningrui-Li/nonlinear_acoustic/master/comparisons/focus70mm/linear_compare/a_0.005/kzk_f2_input_70mm_lateral.png)

##### Depth Planes
Contour plot slices at depth positions of 3.75 cm, 5.10 cm, and 6.40 cm can be found below. These planes were chosen because the KZK sim had maximum normalized intensity at a depth of 6.40 cm, while the Field II sim had maximum normalized intensity at a depth of 3.75 cm.

 * Field II - Depth Plane Contour Plots

![Depth Plane Contour Plots, Field II Sim, 70 mm Focus](https://raw.githubusercontent.com/Ningrui-Li/nonlinear_acoustic/master/comparisons/focus70mm/linear_compare/a_0.005/field2_70mm_depth.png)

 * KZK, Expt. Inputs - Depth Plane Contour Plots

![Depth Plane Contour Plots, Linear KZK Sim, 70 mm Focus](https://raw.githubusercontent.com/Ningrui-Li/nonlinear_acoustic/master/comparisons/focus70mm/linear_compare/a_0.005/kzk_70mm_depth.png)

 * KZK, Field II Inputs - Depth Plane Contour Plots

![Depth Plane Contour Plots, Linear KZK Sim, Field II Inputs, 70 mm Focus](https://raw.githubusercontent.com/Ningrui-Li/nonlinear_acoustic/master/comparisons/focus70mm/linear_compare/a_0.005/kzk_f2_input_70mm_depth.png)

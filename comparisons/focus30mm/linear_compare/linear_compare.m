clear; clf;

addpath ../../metrics/

%% Field II and KZK (linear) sim comparisons - 30 mm focus

% Field
fprintf('Field II:\n')
load /luscinia/nl91/nonlinear_acoustic/field/field_c52_30mm/dyna-I-f2.36-F2.8-FD0.030-a0.45.mat
field_ele = -1:0.02:0;
field_lat = 0:0.02:1.2;
field_depth = 0:0.05:5.2;

intensity_field_30mm = reshape(intensity, 51, 61, 105);
intensity_field_30mm = flip(intensity_field_30mm, 3);
intensity_field_30mm = intensity_field_30mm ./ max(intensity_field_30mm(:));
intensity_field_30mm_depth = field_depth;

% Getting location of max intensity
[maxEle, maxLat, maxDepth] = intensitypeak(intensity_field_30mm, field_ele, ...
                                           field_lat, field_depth);
fprintf(['The maximum intensity occurs at %.2f cm in elevation position, '...
         '%.2f cm in lateral position, and %.2f cm in depth position.\n'],...
         maxEle, maxLat, maxDepth)         
fprintf('\n')

% Linear KZK w/ Expt Measured Inputs
fprintf('Linear KZK:\n')
load /luscinia/nl91/scratch/c52/focus30mm/quarter_symmetric/c52_intensity_vals_30_qsymm_intensity.mat

% cut data to just quarter of all values, since it is quarter symmetric
kzk_ele = ele(1:(floor(length(ele)/2)+1));
kzk_lat = lat((floor(length(lat)/2)+1):end);
kzk_depth = depthStep;
% mm to cm
kzk_ele = kzk_ele./10;
kzk_lat = kzk_lat./10;
kzk_depth = kzk_depth./10;

intensity_kzk_30mm = permute(intensity, [3 2 1]);
intensity_kzk_30mm = intensity_kzk_30mm(1:length(kzk_ele), length(kzk_lat):end, :);
intensity_kzk_30mm = intensity_kzk_30mm ./ max(intensity_kzk_30mm(:));
intensity_kzk_30mm_depth = kzk_depth;

% Calculating location of max intensity
[maxEle, maxLat, maxDepth] = intensitypeak(intensity_kzk_30mm, kzk_ele, ...
                                           kzk_lat, kzk_depth);
fprintf(['The maximum intensity occurs at %.2f cm in elevation position, '...
         '%.2f cm in lateral position, and %.2f cm in depth position.\n'],...
         maxEle, maxLat, maxDepth)
fprintf('\n')     

% Linear KZK w/ Field II Pressure Input
fprintf('Linear KZK:\n')
load(['/luscinia/nl91/nonlinear_acoustic/kzk/field_ii_c52_focus30mm/'...
      'B_0/a_0.45_B_0/c52_30mm_intensity_field_field_ii_pressure_input.mat'])
          
% remove first depth plane (not sure why there are sometimes 106 depth
% planes instead of 105... maybe bug???)
% intensity = intensity(1:end-1, :, :);
          
intensity_kzk_finput_30mm = permute(intensity, [3 2 1]);
intensity_kzk_finput_30mm = intensity_kzk_finput_30mm(1:length(kzk_ele), length(kzk_lat):end, :);
intensity_kzk_finput_30mm = intensity_kzk_finput_30mm ./ max(intensity_kzk_finput_30mm(:));
intensity_kzk_finput_30mm_depth = kzk_depth;

% Calculating location of max intensity
[maxEle, maxLat, maxDepth] = intensitypeak(intensity_kzk_finput_30mm, kzk_ele, ...
                                           kzk_lat, kzk_depth);
fprintf(['The maximum intensity occurs at %.2f cm in elevation position, '...
         '%.2f cm in lateral position, and %.2f cm in depth position.\n'],...
         maxEle, maxLat, maxDepth)
fprintf('\n')     

figure(1)
subplot(3, 1, 1)
imagesc(squeeze(intensity_field_30mm(end, :, :))')
subplot(3, 1, 2)
imagesc(squeeze(intensity_kzk_30mm(end, :, :))')
subplot(3, 1, 3)
imagesc(squeeze(intensity_kzk_finput_30mm(end, :, :))')

%% center trace plot
figure(2)
centertrace('field_kzk_centertrace_c52_30mm.png', 'Field vs. KZK Center Trace - C5-2, 30 mm Focus',...
            intensity_field_30mm, intensity_field_30mm_depth, 'Field II, C5-2, 30 mm Focus',...
            intensity_kzk_30mm, intensity_kzk_30mm_depth, 'KZK, Expt. Input, C5-2, 30 mm Focus',...
            intensity_kzk_finput_30mm, intensity_kzk_30mm_depth, 'KZK, Field II Input, C5-2, 30mm Focus')
%% KZK, expt measured inputs, contour plots
% 10 is the ASCII value for a newline. used to break subplot title string
% into multiple lines.
nln = 10;

% contour plot in elevation-lateral plane at various depths
% Depth planes in 2.3 cm, 2.75 cm, and 3.2 cm planes. These planes chosen
% because KZK intensity field is maximum in 2.3 cm plane and Field II
% intensity field is max in 3.2 cm plane.
figure(3);
contourplots('kzk_30mm_depth.png', ['KZK Sim' nln 'Expt. Input, 30 mm Focus' nln 'Depth Plane'],...
              intensity_kzk_30mm, kzk_ele, kzk_lat, kzk_depth, 3,...
              [47 56 65], [0 0.15 -.5 0]);

% contour plot in depth-elevation plane at various lateral positions
% Lateral planes are 0.00 cm, 0.08 cm, and 0.16 cm planes. 0.00 cm plane
% was chosen because both KZK and Field II intensity fields were maximum at
% 0.00 cm lateral position.
figure(4);
contourplots('kzk_30mm_lateral.png', ['KZK Sim' nln 'Expt. Input, 30 mm Focus' nln 'Lateral Plane'],...
             intensity_kzk_30mm, kzk_ele, kzk_lat, kzk_depth, 2,...
             [1 5 9], [-.51 0 0 5.2]);

% contour plot in depth-lateral plane at various elevational positions
% Elevational planes are -0.14 cm, -0.06 cm, and 0.00 cm planes. These 
% planes were chosen because KZK intensity field is maximum in -0.14 cm 
% plane while the Field II intensity field is max in 0.00 cm plane.
figure(5);
contourplots('kzk_30mm_elevational.png', ['KZK Sim' nln 'Expt. Input, 30 mm Focus' nln 'Elevational Plane'],...
             intensity_kzk_30mm, kzk_ele, kzk_lat, kzk_depth, 1,...
             [44 48 51], [0 .35 0 5.2]);  

%% Field II contour plots
% contour plot in elevation-lateral plane at various depths
% Depth planes in 2.3 cm, 2.75 cm, and 3.2 cm planes.
figure(6);
contourplots('field2_30mm_depth.png', ['Field II, 30 mm Focus' nln 'Depth Plane'],...
             intensity_field_30mm, field_ele, field_lat, field_depth, 3,...
             [47 56 65], [0 0.15 -.5 0])

% contour plot in depth-elevation plane at various lateral positions
% Lateral planes are 0.00 cm, 0.08 cm, and 0.16 cm planes.
figure(7);
contourplots('field2_30mm_lateral.png', ['Field II, 30 mm Focus' nln 'Lateral Plane'],...
             intensity_field_30mm, field_ele, field_lat, field_depth, 2,...
             [1 5 9], [-.51 0 0 5.2])

% contour plot in depth-lateral plane at various elevational positions         
% Elevational planes are -0.14 cm, -0.06 cm, and 0.00 cm planes.
figure(8);
contourplots('field2_30mm_elevational.png', ['Field II, 30 mm Focus' nln 'Elevational Plane'],...
             intensity_field_30mm, field_ele, field_lat, field_depth, 1,...
             [44 48 51], [0 0.35 0 5.2])
         
%% KZK, Field II pressure input, contour plots 
% contour plot in elevation-lateral plane at various depths
% Depth planes in 2.3 cm, 2.75 cm, and 3.2 cm planes. These planes chosen
% because KZK intensity field is maximum in 2.3 cm plane and Field II
% intensity field is max in 3.2 cm plane.
figure(9);
contourplots('kzk_f2_input_30mm_depth.png', ['KZK Sim' nln 'Field II Inputs, 30 mm Focus' nln 'Depth Plane'],...
              intensity_kzk_finput_30mm, kzk_ele, kzk_lat, kzk_depth, 3,...
              [47 56 65], [0 0.15 -.5 0]);

% contour plot in depth-elevation plane at various lateral positions
% Lateral planes are 0.00 cm, 0.08 cm, and 0.16 cm planes. 0.00 cm plane
% was chosen because both KZK and Field II intensity fields were maximum at
% 0.00 cm lateral position.
figure(10);
contourplots('kzk_f2_input_30mm_lateral.png', ['KZK Sim' nln 'Field II Inputs, 30 mm Focus' nln 'Lateral Plane'],...
             intensity_kzk_finput_30mm, kzk_ele, kzk_lat, kzk_depth, 2,...
             [1 5 9], [-.51 0 0 5.2]);

% contour plot in depth-lateral plane at various elevational positions
% Elevational planes are -0.14 cm, -0.06 cm, and 0.00 cm planes. These 
% planes were chosen because KZK intensity field is maximum in -0.14 cm 
% plane while the Field II intensity field is max in 0.00 cm plane.
figure(11);
contourplots('kzk_f2_input_30mm_elevational.png', ['KZK Sim' nln 'Field II Inputs, 30 mm Focus' nln 'Elevational Plane'],...
             intensity_kzk_finput_30mm, kzk_ele, kzk_lat, kzk_depth, 1,...
             [44 48 51], [0 .35 0 5.2]); 
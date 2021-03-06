function [] = create_vtk(intensity, lat, ele, depth, vtsFile, debug)
% create_vtk - Creates VTK file of intensity field
% INPUTS:
% intensity - 3D intensity field matrix with dimensions depth x lateral x
% elevation.
% lat - vector with lateral positions
% ele - vector with elevational positions
% depth - vector with depth positions
% vtkFile - name of output .vts file (ex. 'c52_30mm_intensity.vts')
% debug - if 1 -> does not delete intermediate nodes, elems, intensity
% files so that they can be used for debugging. (default: 0)
% OUTPUT:
% vtkFile created in CWD.

if nargin < 6
    debug = 0;
end

% mm to cm
lat = lat/10;
ele = ele/10;
depth = depth/10;
% normalize
intensity = intensity / max(intensity(:)); 

% Generating node and element files
system(sprintf(['python /luscinia/nl91/matlab/fem/mesh/GenMesh.py ',...
                '--numElem %d %d %d --xyz %.1f %.1f %.1f %.1f %.1f %.1f'],...
                size(intensity,3)-1,size(intensity,2)-1,size(intensity,1)-1,...
                ele(1), ele(end), lat(1), lat(end),...
                -round(depth(end)), round(depth(1))))

% Writing pseudo-pointloads file to use as input to
% create_pointloads_vtk.py.
intensityFile = [vtsFile '.txt'];
sprintf('Writing intensity values to %s...\n', intensityFile)
fid = fopen(intensityFile, 'w');
nodeid = 1;
for depths=size(intensity, 1):-1:1
    fprintf('%d out of %d\n', size(intensity, 1)-depths, size(intensity, 1))
    for later=1:size(intensity, 2)
        for elev=1:size(intensity, 3)
            fprintf(fid,'%d,3,1,%e,0\n',nodeid,intensity(depths,later,elev));
            nodeid = nodeid + 1;
        end
    end
end
fclose(fid);
% Generate .vtk file for visualizing in Paraview using
% create_pointloads_vtk.py
system(sprintf(['python /luscinia/nl91/matlab/test/fem/mesh/', ...
                'create_pointloads_vtk.py --nodefile nodes.dyn ', ...
                '--loadfile %s --loadout %s'], ...
                intensityFile, vtsFile));

if debug ~= 1
    % remove nodes.dyn and elems.dyn
    system('rm nodes.dyn');
    system('rm elems.dyn');
    system(sprintf('rm %s', intensityFile));
end
end
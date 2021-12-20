% LSG-CPD: CPD with Local Surface Geometry
% Demo of Stanford Lounge Dataset
% Author: Weixiao Liu, Hongtao Wu 
% Johns Hopkins University & National University of Singapore

clc
clear
close all

% --------------- Load Data ---------------
source_ply = "data/wrap/source.ply";
target_ply = "data/wrap/target.ply";
pc_source = pcread(source_ply);
pc_target = pcread(target_ply);

config = load("data/wrap/config.mat");
config.outlierRatio = double(config.outlierRatio);

tic
xform = LSGCPD(pc_source, pc_target, 'outlierRatio', config.outlierRatio);
time = toc;

% --------------- Visualization ---------------
%pc_result = pctransform(pc_source, xform);

%figure(1)
%ShowPointCloudPair(pc_source, pc_target, 'backgroundColor', 'white', 'grid', 'hide', 'axis', 'hide')
%figure(2)
%ShowPointCloudPair(pc_result, pc_target, 'backgroundColor', 'white', 'grid', 'hide', 'axis', 'hide')

output_matrix = zeros(4,4);

if (out.inls>0)
    for i=1:3
        for j=1:3
            output_matrix(i,j)=xform.Rotation(i,j);
        end
        output_matrix(i,4) = xform.Translation(i);
    end
    output_matrix(4,4)=1.0;
end

file_id=fopen("./data/wrap/output.txt", 'w');
fprintf(file_id,"%d\n", time);
fclose(file_id);
writematrix(output_matrix, "./data/wrap/output.txt",'Delimiter','tab', 'WriteMode', 'append');

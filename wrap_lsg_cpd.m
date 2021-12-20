% LSG-CPD: CPD with Local Surface Geometry
% Demo of Stanford Lounge Dataset
% Author: Weixiao Liu, Hongtao Wu 
% Johns Hopkins University & National University of Singapore

clc
clear
close all

addpath('utility_functions')

% --------------- Load Data ---------------
source_ply = "data/wrap/source.ply";
target_ply = "data/wrap/target.ply";
pc_source = pcread(source_ply);
pc_target = pcread(target_ply);

config = load("data/wrap/config.mat");
config.outlierRatio = double(config.outlierRatio);
config.maxIter = double(config.maxIter);
config.tolerance = double(config.tolerance);
config.truncationThreshold = double(config.truncationThreshold);
config.optimizationIter = double(config.optimizationIter);
config.optimizationTolerance = double(config.optimizationTolerance);
config.neighbours = double(config.neighbours);
config.maxPlaneRatio = double(config.maxPlaneRatio);

tic
xform = LSGCPD(pc_source, pc_target, 'outlierRatio', config.outlierRatio, 'maxIter', config.maxIter, 'tolerance', config.tolerance, 'truncationThreshold', config.truncationThreshold, 'optimizationIter', config.optimizationIter, 'optimizationTolerance', config.optimizationTolerance, 'neighbours', config.neighbours, 'maxPlaneRatio', config.maxPlaneRatio);
time = toc;

% --------------- Visualization ---------------
%pc_result = pctransform(pc_source, xform);

%figure(1)
%ShowPointCloudPair(pc_source, pc_target, 'backgroundColor', 'white', 'grid', 'hide', 'axis', 'hide')
%figure(2)
%ShowPointCloudPair(pc_result, pc_target, 'backgroundColor', 'white', 'grid', 'hide', 'axis', 'hide')

output_matrix = zeros(4,4);

    for i=1:3
        for j=1:3
            output_matrix(i,j)=xform.Rotation(i,j);
        end
        output_matrix(i,4) = xform.Translation(i);
    end
    output_matrix(4,4)=1.0;

file_id=fopen("./data/wrap/output.txt", 'w');
fprintf(file_id,"%.2f\n", time);
fclose(file_id);
writematrix(output_matrix, "./data/wrap/output.txt",'Delimiter','tab', 'WriteMode', 'append');

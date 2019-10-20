clear all
clc

% This script converts an EDF (european data file) downloaded from
% physionet into physical units and then saves it as a .mat file in the
% file path specified.
% Contributor(s): Tanner Penko & Company


FileNames = dir('*.txt');

for x = 1:length(FileNames)
    
    SampledFile = FileNames(x).name;
    [~,DataPhysical] = edfread(SampledFile);
    save(['MatlabConvertedFiles\' SampledFile '.mat'], 'DataPhysical');
end
clear all
clc

% This script converts some .mat files in the labwalk section to physical
% untis by simply calling rdmat and saving the files again.
% Don't want to do this in our master script
% ***Note that rdmat or then entire WFDB toolbox must be in the directory
% or mapped for this script to work.

FileNames = dir('*.mat');

for x = 1:length(FileNames)
    
    SampledFile = FileNames(x).name;
    [~,DataPhysicalLabWalks,~,~] = rdmat(SampledFile);
    save(['MatlabConvertedFiles\' SampledFile '.mat'], 'DataPhysical');
    
end
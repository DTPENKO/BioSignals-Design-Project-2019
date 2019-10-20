%Biosignals Group 10 Long Term Movement Gait Fall Risk Index
% Contributors: Tanner Penko, Hannah Osswald, Brandon Christian, Amanda ,
% and Fran P

% Load Relevant Excel Files to Extract Data. **** excel files must be in
% directory or pathed

[PatientInfoText, PatientInfoNumeric, PatientInfoRaw] = xlsread('ClinicalDemogData_COFL.xlsx');
[~,~, PatientSelfReportInfoRawData] = xlsread('ReportHome75h.xlsx');

% Load Control Group 3 Day Data ~~

%3DayControlGroupDataPath = {'E:\GaitDatabase\.mat version files\3DayControl\CO00%dm.mat'};
%3DayFallersGroupDataPath = {'E:\GaitDatabase\.mat version files\3DayFallers\CO00%dm.mat'};

FileNames = dir('*.mat'); % Find all file names

LoadThisManyVariables = 1:1:length(FileNames) %Default = length(FileNames) *** Specify files you want to load

% May add more code here to seperate variables in to sections i.e. control
% group vs fall group and labwalk seperation.

% Load all specified data *** Note that this can crash matlab if selected
% portion is too large. 

for x = LoadThisManyVariables

    SampledFile = FileNames(x).name;
    GaitFile(x) = load([SampledFile,'.mat']);
    
end

% Load Fall Risk Group 3 Day Data ~~


% Load Control Group Labwalk Data ~~

% Load Fall Risk Group Labwalk Data ~~
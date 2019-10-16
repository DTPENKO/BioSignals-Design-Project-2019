%Biosignals Group 10 Long Term Movement Gait Fall Risk Index
% Contributors: Tanner Penko, Hannah Osswald, Brandon Christian, Amanda ,
% and Fran P

% Load Relevant Excel Files to Extract Data.

%[PatientInfoText, PatientInfoNumeric, PatientInfoRaw] = xlsread('ClinicalDemogData_COFL.xlsx');
%[~,~, PatientSelfReportInfoRawData] = xlsread('ReportHome75h.xlsx');

% Load Control Group 3 Day Data ~~

for x = 1:1:2 % 44 People in Control Group
    %DataFileNameX = sprintf('E:\GaitDatabase\.mat version files\3DayControl\CO00%dm.mat', x);
    %InfoFileNameX = sprintf('E:\GaitDatabase\.matCO00%dm.info', x);
    ControlSubjectData(x) = load('E:\GaitDatabase\.mat version files\3DayControl\CO001m.mat');
   % ControlSubjectInfo(x) = load(InfoFileNameX);
end

% Load Fall Risk Group 3 Day Data ~~


% Load Control Group Labwalk Data ~~

% Load Fall Risk Group Labwalk Data ~~
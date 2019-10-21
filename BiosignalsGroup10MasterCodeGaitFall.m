%Biosignals Group 10 Long Term Movement Gait Fall Risk 
% Contributors: Tanner Penko, Hannah Osswald, Brandon Christian, Amanda ,
% and Fran P

% Load Relevant Excel Files to Extract Data. **** excel files must be in
% directory or pathed

[PatientInfoText, PatientInfoNumeric, PatientInfoRaw] = xlsread('ClinicalDemogData_COFL.xlsx');
[~,~, PatientSelfReportInfoRawData] = xlsread('ReportHome75h.xlsx');

% Some processing function here to load group sets via the excel files
% ****Brandon mentioned doing this?


% Load in selected variables *** Note that this can crash matlab if selected

    % Search directory for all .mat files
    FileNames = dir('*.mat'); % Find all file names in current directory ***This is your external harddrive with files OR github local repo if doing smaller file testing
    
    SomeInputYouWant = input('Enter number of files wanted or a matrix size i.e x:y size' )
    if (SomeInputYouWant = Matrix(xxx)
       LoadThisManyVariables = SomeInputYouWant; %Default = length(FileNames) *** Specify files you want to load
    else
       LoadThisManyVariables = 1:1:SomeInputYouWant; %Default = length(FileNames) *** Specify files you want to load
    end

    for x = LoadThisManyVariables

        SampledFile = FileNames(x).name; % SAMPLEDFILE SHOULD BE DETERMINED BASED ON EXCEL IMPORT OR TEST .mat FILE
        GaitFile(x) = load([SampledFile,'.mat']);  % GAITFILE(X) SHOULD BE BASED ON GROUPING VARIABLES DEFINED IN EXCEL IMPORT OR TEST .mat FILE
    
    end


% INITIAL PLOTTING AND WINDOWING
% Note this may need to be limited to one or two files if datasets chosen
% is large. 

fs = 100; % Samples/second
WindowSize = 60; % Seconds of data in the window
PercentOverlap = 0.5; % Window over lap from previous window (percentage of samples)
SamplesPerWindow = WindowSize * fs; % Number of samples in a window
WindowIncrementSwitch = (1-PercentOverlap) * SamplesPerWindow; % Number of samples in an incremented window


% PROCESSING FUNCTIONS BELOW


% Filter out all walking data that is less than 60 seconds long with SMA $
% power decomp


% Filter: low pass all data to remove high frequency data ~cutoff F = 40 Hz


% Energy frequency domain filter, remove below 0.05 energy


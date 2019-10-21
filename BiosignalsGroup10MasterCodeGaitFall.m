% Biosignals Group 10 Long Term Movement Gait Fall Risk 
% Contributors: Tanner Penko, Hannah Osswald, Brandon Christian, Amanda ,
% and Fran P

% Load Relevant Excel Files to Extract Data. **** excel files must be in
% directory or pathed

[PatientInfoText, PatientInfoNumeric, PatientInfoRaw] = xlsread('ClinicalDemogData_COFL.xlsx');
[~,~, PatientSelfReportInfoRawData] = xlsread('ReportHome75h.xlsx');

% Some processing function here to load group sets via the excel files
% ****Brandon mentioned doing this?ff


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


% INITIAL PLOTTING AND WINDOWING *** This may need to be limited

fs = 100; % Samples/second
WindowSize = 60; % Seconds of data in the window
PercentOverlap = 0.5; % Window over lap from previous window (percentage of samples)
SamplesPerWindow = WindowSize * fs; % Number of samples in a window
WindowIncrementSwitch = (1-PercentOverlap) * SamplesPerWindow; % Number of samples in an incremented window
WindowIncrementTime = (((1-PercentOverlap)*SamplesPerWindow)/fs); % Time interval in a window increment used for number of samples
StartIndex = 1 % Sample to start with
EndIndex = SamplesPerWindow;
WindowCounter = 0; % Number goes up each window

Sample2Process = XXXX % Select sample that will be windowed or lay multiple sample on the same thing
% Call plotATM to do all of them?

while(endIndex<=length(Sample2Process))
   
    %Assign EEG data for current window to currEEGData
    currEEGData = convertedEEGData(startIndex:endIndex,eegChannel);
    
    %Plot Current EEG Data in Specified Window
    hold on
    plot(currEEGData);
    xlabel('Sample Number (n)');
    ylabel('Voltage (microVolts)');
    %Set ylimit for plotting visualization
    ylim([-200,200]);
    
    %Calculate mean voltage for current window
    currWindMean = mean(currEEGData);
    
    %Plot Mean in Plot Title 
    title(['The mean voltage of the current EEG window is: ',num2str(currWindMean)]);
    
    %Increment EEG Data to next window for analysis and plotting
    startIndex = startIndex+windIncrement;
    endIndex = endIndex+windIncrement;
   
    %Wait for key to be pressed to increment through next window
    waitforbuttonpress;
     
end



% PROCESSING FUNCTIONS BELOW


% Filter out all walking data that is less than 60 seconds long with SMA $
% power decomp


% Filter: low pass all data to remove high frequency data ~cutoff F = 40 Hz


% Energy frequency domain filter, remove below 0.05 energy


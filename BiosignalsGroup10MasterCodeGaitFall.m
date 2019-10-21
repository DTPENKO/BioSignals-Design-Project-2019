% Biosignals Group 10 Long Term Movement Gait Fall Risk 
% Contributors: Tanner Penko, Hannah Osswald, Brandon Christian, Amanda ,
% and Fran P

% Load Relevant Excel Files to Extract Data. **** excel files must be in
% directory or pathed

[PatientInfoText, PatientInfoNumeric, PatientInfoRaw] = xlsread('ClinicalDemogData_COFL.xlsx');
[~,~, PatientSelfReportInfoRawData] = xlsread('ReportHome75h.xlsx');

% Import patient variable names from pre-processed excel file


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

% Biosignals Group 10 Long Term Movement Gait Fall Risk

% Contributors: Tanner Penko, Hannah Osswald, Brandon Christian, Amanda ,

% and Fran P

% Load Relevant Excel Files to Extract Data. **** excel files must be in

% directory or pathed

% if/else statement to determine if the patient identified is determined to be a faller/non-faller from clinical test results.

% Function to repeat if/else clinical identifier for each patient

%Column labels for spreadsheet output
excelHeader = {‘patientID#’, ‘Fall or Non-Faller’)

%Converting 

[PatientInfoText, PatientInfoNumeric, PatientInfoRaw] = xlsread('ClinicalDemogData_COFL.xlsx');

[~,~, PatientSelfReportInfoRawData] = xlsread('ReportHome75h.xlsx');

% Call groupsets from pre-processed excel file (faller vs. non-faller)

% Load in selected groupsets *** Note this can run for hours if groupset is large (~30 million samples per patient) 

   % Search directory for all .mat files

   FileNames = dir('*.mat'); % Find all file names in current directory ***This is your external harddrive with files OR github local repo if doing smaller file testing. Compare this file with groupset info to find .mat files needed.

   for x = 1:1:length(UploadData)

       SampledFile = FileNames(x).name; % SAMPLEDFILE SHOULD BE DETERMINED BASED ON EXCEL IMPORT OR TEST .mat FILE

       GaitFile(x) = load([SampledFile,'.mat']);  % GAITFILE(X) SHOULD BE BASED ON GROUPING VARIABLES DEFINED IN EXCEL IMPORT OR TEST .mat FILE

   end

% INITIAL PLOTTING AND WINDOWING *** This may need to be limited

Sample2Window = 'CO001m'; % Select sample that will be windowed.

WindowSize = 60; % Seconds of data in the window

PercentOverlap = 0.5; % Window overlap from previous window (percentage of samples)

SamplesPerWindow = WindowSize * fs; % Number of samples in a window

WindowIncrementSwitch = (1-PercentOverlap) * SamplesPerWindow; % Number of samples in an incremented window

WindowIncrementTime = (((1-PercentOverlap)*SamplesPerWindow)/fs); % Time interval in a window increment used for number of samples

StartIndex = 1; % Sample to start with

EndIndex = SamplesPerWindow;

WindowCounter = 0; % Number goes up each window

while(endIndex<=length(Sample2Window))

   %Assign Accelerometer data for current window to sampleGaitData


   sampGaitData = Sample2Window(startIndex:endIndex,:);

   %Plot Current Accelerometer Data in Specified Window
   hold on

   plot(sampGaitData);

   xlabel('Sample Number (n)');

   ylabel('Acceleration (degrees/second)');

   %Set y-limit for plotting visualization

   ylim([-200,200]);

   %Plot Mean in Plot Title

   title(['The mean voltage of the current Gait window is: ',num2str(currWindMean)]);

   %Increment Accelerometer Data to next window for analysis and plotting

   startIndex = startIndex+windIncrement;

   endIndex = endIndex+windIncrement;

   %Wait for key to be pressed to increment through next window

   waitforbuttonpress;

end

% PROCESSING FUNCTIONS BELOW

% Filter: low pass all data to remove high frequency data ~cutoff F = XX Hz

LowPassedData = LowPassFilterFunction(OriginalGaitData);

% Filter out power decomp SMA filter

% power decomp

SMAFilteredData = SMAFilterFunction(LowPassedData);

% Calculate in the frequency domain - Call Fournier Transform

FrequencyDomainFilteredSignal = FrequencyDecompFunction(SMAFilteredData);

% Energy frequency domain filter, remove below 0.05 energy

EnergyFilteredData = EnergyFilterFunction(SMAFilteredData);

% Filter data to eliminate all data sequences less than 60 seconds in length

RelevantWalkingData = LazyFilterFunction(EnergyFilteredData)

% Acceleration Extraction

% Functions to analyze acceleration wave characteristics. 

%average step and stride duration, regulatory measures, harmonic ratio, acceleration range

%Organization of data based on acceleration characteristics

			     %Machine Learning
			     %(algorithm? Function?)Machine Learning 
                                        %Algorithm that takes features and says fall risk or not. 
%Potentially an indicator. An exemplor has a target output (fall: Yes=1, No=0. Can do over time or whatever window for the appropriate resolution to determine the 1 or 0. Machine learning finds trends and patterns, while minimizing the error. We need to define 0 or 1 by thresholding the value. Output activation of a neuro network. ROC curve, calculates sensitivity and specificity. We set the 1 and 0 and compare it to the gold standard.
			     %Output of fall index value 0 or 1
                                        %Comparison of Calculated Fall Index Value v. Clinical Fall Index
                                        %


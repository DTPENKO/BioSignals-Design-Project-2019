% Biosignals Group 10 Long Term Movement Gait Fall Risk
% Contributors: Tanner Penko, Hannah Osswald, Brandon Christian, Amanda,and Fran P

% Load excel files to pre-process group sets

[~,~,PatientInfoRaw] = xlsread('ClinicalDemogData_COFL.xlsx');
[~,~,PatientSelfReportInfoRawData] = xlsread('ReportHome75h.xlsx');

[FallerGroupIndex, NonFallerGroupIndex] = ExcellFileProcessingFunction(PatientInfoRaw);
%excelHeader = {‘patientID#’, ‘Fall or Non-Faller’

% Call groupsets from pre-processed excel file (faller vs. non-faller)

% Load in selected groupsets *** Note this can run for several minutes if groupset is large (~30 million samples per patient) 

   UploadGroupSetYesNo = input('Would you like to upload a group set? (Y/N) : ', 's'); % Bypass groupset if testing code with manually loaded data
   
   if UploadGroupSetYesNo == 'Y'
        % Search directory for all .mat files
        DirectoryFileNames = dir('*.mat'); % Find all file names in current directory 
        
        % Find file names to upload based on excel group(s)
        FileExtension(1:length(EXCELFILENAMEFROMBRANDON) = {'.edf.txt.mat'}; % File extension format downloaded from physionet
        ControlFiles2Load = append(EXCELFILENAMEFROMBRANDONCONTROLGROUP, FileExtension); % Combine file extension to file names
        FallerFiles2Load = (EXCELFILENAMEFROMBRANDONFALLERGROUP, FileExtension);
        %FileTypeEval = char(Files2Load); ControlGroupCCompare = char('C'); FallGroupFCompare =char('F');
        
        for x = 1:1:length(ControlFiles2Load) %Load control group variable based on length of data selected
            
            ControLGroupDataStructure(x) = load([ControlFiles2Load(x),'.mat']);

        end
        
        for y = 1:1:length(FallerFiles2Load) %Load faller group variable based on length of data selected
            
            FallerGroupDataStructure(x) = load([FallerFiles2Load(x),'.mat']);
            
        end   
    end
   

% INITIAL PLOTTING AND WINDOWING *** May compact this to a simple function
WindowNoWindow = input('Would you like to window a sample (type Y/N): ', 's'); %Bypass windowing if not wanted

if WindowNoWindow == 'Y'
    Sample2Window = input('What sample would you like to window?:  ','s') % Select sample that will be windowed. Match this to data file name in workspace not directory.
    %SampleRequest = 'Sample1'; 
    Sample2Window = eval(SampleRequest);
    fs = 100; %Hz frequency sampling rate
    WindowSize = 30; % Seconds of data in the window
    PercentOverlap = 0.5; % Window overlap from previous window (percentage of samples)
    SamplesPerWindow = 1:(WindowSize * fs); % Number of samples in a window
    WindowIncrementSwitch = (1-PercentOverlap) * SamplesPerWindow; % Number of samples in an incremented window
    WindowIncrementTime = (((1-PercentOverlap)*SamplesPerWindow)/fs); % Time interval in a window increment used for number of samples
    StartIndex = 1; % Sample to start with
    EndIndex = length(SamplesPerWindow);
    WindowCounter = 1; % Number goes up each window

    while(endIndex<=length(Sample2Window))

        %Assign Accelerometer data for current window to Sample2Window

        CurrentSample2WindowAcceleration = Sample2Window.DataPhysical(1:3, StartIndex:EndIndex);
        CurrentSample2WindowVelocity = Sample2Window.DataPhysical(4:6, StartIndex:EndIndex);
        
        %Plot Current Accelerometer Data in Specified Window
        figure()
        plot(SamplesPerWindow,CurrentSample2WindowAcceleration);
        xlabel('Sample Number (n)');
        ylabel('Acceleration xyz (g)')
        legend('Acceleration (V)', 'Acceleration (ml)', 'Acceleration (ap)');
        title('Acceleration Data');
        
        %Plot Current Velocity Data in a New Window
        figure()
        plot(SamplesPerWindow, CurrentSample2WindowVelocity);
        xlabel('Sample Number (n)');
        ylabel('Velocity (degrees/second)');
        legend('Velocity (yaw)', 'Velocity (pitch)', 'Velocity (roll)');
        title('Velocity Data');

        %Increment Accelerometer Data to next window for analysis and plotting

        startIndex = startIndex+windIncrement;
        endIndex = endIndex+windIncrement;
        
        windowcounter = windowcounter + 1
        %Wait for key to be pressed to increment through next window

        waitforbuttonpress;

    end
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

% Step detection function? Based on simple 'Z' velocity peak detection.

%Machine Learning notes from Pappada
%(algorithm? Function?)Machine Learning 
%Algorithm that takes features and says fall risk or not. 
%Potentially an indicator. An exemplor has a target output (fall: Yes=1, No=0. Can do over time or whatever window for the appropriate resolution to determine the 1 or 0. Machine learning finds trends and patterns, while minimizing the error. We need to define 0 or 1 by thresholding the value. Output activation of a neuro network. ROC curve, calculates sensitivity and specificity. We set the 1 and 0 and compare it to the gold standard.
%Output of fall index value 0 or 1
%Comparison of Calculated Fall Index Value v. Clinical Fall Index
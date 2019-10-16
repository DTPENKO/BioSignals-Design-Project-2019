%Biosignals Group 10 Long Term Movement Gait Fall Risk Index
% Contributors: Tanner Penko, Hannah Osswald, Brandon Christian, Amanda ??,
% Fran P



%[PatientInfoText, PatientInfoNumeric, PatientInfoRaw] = xlsread(GaitFFILE HERE);

% Load Control Group Data ~~

for x = 1:1:1 % 44 People in Control Group
    ControlSubjectData(x) = load(CO00(x).mat);
    ControlSubjectInfo(x) = load(CO00(x).info);
end
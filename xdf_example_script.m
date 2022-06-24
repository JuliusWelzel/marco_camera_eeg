%% testscript to load xdf data import to fieldtrip

clc; clear all; close all

%% load raw xdf
% dependecies (https://github.com/xdf-modules/xdf-Matlab)

% load xdf with all streams, note this xdf file contains 2 streams
streams = load_xdf('sub-Test_Sim_ses-1_task-Default_run-001_eeg.xdf')

% view info stream 1
display(['Name of first stream: ' streams{1,1}.info.name])
% view info stream 2
display(['Name of first stream: ' streams{1,2}.info.name])

% each stream contains time_stamps and time_series
% time_stamps: the synchronised times per sample
% time_series: can be anything (e.g. matrix as EEG or string array for
% markers)
eeg = streams{1,2};
mrk = streams{1,1};

% plot the first EEG channel and only some samples
plot(eeg.time_stamps(1:30000),eeg.time_series(1,1:30000));
hold on
vline(mrk.time_stamps(1:100)) % plot the first 100 markers

display(unique(mrk.time_series(1:100)))



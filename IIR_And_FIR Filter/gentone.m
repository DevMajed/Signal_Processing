function [note] = gentone(frequency,duration,gain)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%S= duration; % number of seconds per sound;
%(

Fs=8192;
t = [0:1/Fs:duration]; % duration
%gain=0;
note = sin(2*pi*frequency.*t); %  
end







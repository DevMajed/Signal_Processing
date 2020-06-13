function [rest] = genrest(duration) 
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
%S= duration; % number of seconds per sound;
t = [0:1/8192:duration]; % duration
gain=0;
rest = sin(2*pi*t)*gain;%
end


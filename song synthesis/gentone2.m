function [note] = gentone2(frequency,duration,gain,contour)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%S= duration; % number of seconds per sound;
%(
if (contour == 1) 
    
Fs=8192;
t = [0:1/Fs:duration]; % duration

noteold =(sin(2*pi*frequency.*t)*gain); %
env= [ shape(duration) 0]; 
note =  env.*noteold  ;

%)

elseif (contour == 0)
    
Fs=8192;
t = [0:1/Fs:duration]; % duration
%gain=0;
note = sin(2*pi*frequency.*t).*gain; % 
end
end







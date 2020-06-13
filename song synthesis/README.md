# Synthesizing One Republic's Counting Starts using Matlab and some DSP

In this project i Synthesizied Counting starts, which is my favorite song, and then i applied to it ADSR envelope to smooth the sound.
There are few functions i made here, and these are \
gentone.m, which will generate a signal based on a note whenever it is called\
genrest.m which will generate a rest\ 
shape.m which contain the ADSR envelope\
harmonics2.m which will generate harmonics obviously.\
Finally, The CountingStarts.m is the main file that put them all together.\


# The Procedure 

First the signal was generated with a sample frequency of 8192 Hz which is required in order to convert the continuous wave to a discrete wave that computers can handle.\
Since the song is long comparing to the Beethoven melofy that i made in the Band Pass project, i needed to create five vectors each contain a line of the song.\
For each line, the notes and rests were generated using gentone.m and genrest.m functions from the Band Pass project.\
The song was implemented three times in this project,\
the first one was using an ADSR envelope that shapes the duration and then get multiplied by each note in order to smooth the signal from sudden stops.\ 
Although this worked fine, the song was implemented again using the 9th harmonics as well as an echo, both were taken from previous projects,  and that resulted in a better sound.\
The echo was a clear demonstration of the convolution since the echo is adding a delay version of the song by only shifting the time, and since convolving in discrete time moves over each element, the result was as expected.\
Lastly,i tried using my low pass filter that i made in other project in order to create a less noisy sound, and the result was as expected.\
The following spectrogram shows the song before adding the filter and the 9th harmonics.

<img width="619" alt="Screen Shot 2020-06-03 at 10 59 59 AM" src="https://user-images.githubusercontent.com/57555013/83653118-631a6c00-a589-11ea-91ab-83cf642913f0.png">

The next spectrogram shows the song after adding the filter and the 9th harmonics where we can see easly the effect of harmonics\

<img width="578" alt="Screen Shot 2020-06-03 at 11 01 31 AM" src="https://user-images.githubusercontent.com/57555013/83653293-9957eb80-a589-11ea-88a6-aaea1e67f7b5.png">


What is ASDR Envelope :

![ASDR-01](https://user-images.githubusercontent.com/57555013/83654187-be009300-a58a-11ea-94a8-e3b6cdd5de4e.jpg)


Bellow is the score of this song\

C# G# F# F# E E C#
F# F# G# A G# F# E G# F# F# C# E# 
E F# G# B F# F# G# F# E G# 
F# F# G# A G# F# E G# C# E
F# G# B F# F# G# F# E G#

# IIR and FIR Filters with test signals [Analog Signal Processing]
  
This project is devided into three part. In the first part the task is to make a test signal and few types of low pass filter, and then see the effect of each type just for the sake of study.\
These will be Butterworth, Chebyshev Type 1, Chebyshev Type 2, Elliptic filter, and FIR Equiripple filter.\
In the second part of this project, a band pass filter will be created  in order to pass a clarinet melody to it. The clarinet melody i made it for other project, which was generating the 5th symphony of behooven using diffrent instruments in matlab, and it is also shared here.\
The last part is the most intresting because i'll made a song that i love, one republic's counting stars and play with it using some filters,\
bellow i wrote explanations for all three parts of this project. Notice that i wrote these explanations in the past to my friend to explain to him how each part of the code works, so i may talk even about some trivial details.


# IIR Filters
The test signal was generated using harmonics.m  with all Fourier series coefficients equal to 1, and it is 40 unit amplitude harmonics of 100Hz. \
Next, the fast Fourier transform function, fft(x), was used in order to generate the spectrum of the signal and it was assigned to the variable X. The magnitude of the spectrum was converted into decibels using the command mag2db(abs(X)), and then it was plotted against frequency.\
The frequency axis was created using linspace (0, 8196, 16385), and it was assigned to the variable Faxis, and the plot generated was as follows

<img width="570" alt="Screen Shot 2020-06-03 at 8 32 31 AM" src="https://user-images.githubusercontent.com/57555013/83636946-c948c400-a574-11ea-8119-c4e9dafea0c9.png">

Next, fftshift was used in order to shift the frequencies between 4096 and 8192 to be the left half, from - -4096 to 0, and for the right half was obtained by subtracting 4096 from the previous range, faxis. This will make the figure symmetrical and easier to play with.

<img width="552" alt="Screen Shot 2020-06-03 at 8 37 34 AM" src="https://user-images.githubusercontent.com/57555013/83637352-7d4a4f00-a575-11ea-9eeb-e970ab2be7a3.png">



Now, fdatool command was used in order to create the first low pass filter, which is a Butterworth, and the specifications made as shown bellow.

<img width="570" alt="Screen Shot 2020-06-03 at 8 39 35 AM" src="https://user-images.githubusercontent.com/57555013/83637617-e4680380-a575-11ea-89ef-0913a0f2b237.png">


After creating the filter, two variables SOS_LP and G_LB were generated and their values were copied to new variables having the same name in a new script lpfilt.m.
Now, filtering the test signal in the time domain using the filter i just made and assigning it to y using y = sosfilt(SOS_LP, x)

However, in order to not lose the filter after using clear all or after closing the program, the script lpfilt was used to filter the signal since it has the  SOS_LP and G_LB values. Using lpfilter script, the filtered signal was generated and its spectrum as follow\
Notice how only the low frequency contant was passed.\
<img width="592" alt="Screen Shot 2020-06-03 at 8 46 03 AM" src="https://user-images.githubusercontent.com/57555013/83638128-afa87c00-a576-11ea-8068-7608004e00e1.png">

We see that one problem have appeared in the plot which is the 100 dB shift due to ignoring the gain terms that were stored in the variable G_LP, To solve this problem, All the G_LP were multiplied together using the following for loop 
G=1 \
for i = 1:7 \
    G = G_LP(i)*G \
End \
Then, the variable G which contains the product of all the terms was multiplied by the output and then the result was plotted  as follows \
Y = fft(G*y) \
dBY= mag2db(abs(Y))

<img width="588" alt="Screen Shot 2020-06-03 at 8 51 06 AM" src="https://user-images.githubusercontent.com/57555013/83638604-63aa0700-a577-11ea-8fef-66b253060fdb.png">

After comparing the sound of the two signals, i found the sound of the unfiltered signal was sharper and more noisey due to the presence of the high frequency sounds while the filtered sound is smother.\


Next, few other types of filters were studied and compared and these are Chebyshev Type 1, Chebyshev Type 2 and then  Elliptic. \
Since for all types the same specifications were used, it was observed that the decay become sharper for each one in order respectively. \
We can see clearly that the transition band is longer in Butterworth filter comparing to Chebyshev filter.\
The other observation is that the Butterworth decreases as the frequency increases from 0 to infinity, while Chebyshev filter have ripples in the passband and stopband.\
Elliptic filter comparing to the other filters have stepper cutoff slope, however, it has ripples in both passband and stop band. \

Here, designing the Chebyshev Type 1, Chebyshev Type 2 and Elliptic respectively \
<img width="660" alt="Screen Shot 2020-06-03 at 8 59 33 AM" src="https://user-images.githubusercontent.com/57555013/83639526-cbad1d00-a578-11ea-9b00-7aba98e71f0c.png">

<img width="606" alt="Screen Shot 2020-06-03 at 8 59 49 AM" src="https://user-images.githubusercontent.com/57555013/83639539-d23b9480-a578-11ea-9607-adceb8d86f88.png">

<img width="605" alt="Screen Shot 2020-06-03 at 9 00 20 AM" src="https://user-images.githubusercontent.com/57555013/83639559-d8317580-a578-11ea-9bfc-426a25ca3d4a.png">

# FIR Filters
Next, switching  from IIR to FIR Equiripple, more ripples in the stopband were observed as shown bellow.

<img width="605" alt="Screen Shot 2020-06-03 at 9 09 04 AM" src="https://user-images.githubusercontent.com/57555013/83640332-f9df2c80-a579-11ea-8ef1-ed4e72e2989e.png">

Testing elliptic filter again with, but this time with pass value of 10 dB instead of 1 dB,
it was observed that the stop band has less ripples which follows a stepper decay as will as small fluctuations in the passband as shown bellow.

<img width="600" alt="Screen Shot 2020-06-03 at 9 12 13 AM" src="https://user-images.githubusercontent.com/57555013/83640643-69edb280-a57a-11ea-9b90-c01fa5635776.png">

* Here the G_LP and SOS_LP Values that i sued
SOS_LP = [1,2,1,1,-1.21471872152270,0.822635237134600;1,2,1,1,-1.03705005613104,0.556050747787483;1,2,1,1,-0.916821713829899,0.375653089220359;1,2,1,1,-0.837540994224741,0.256695646137065;1,2,1,1,-0.789279735192294,0.184281621604082;1,2,1,1,-0.766419262204284,0.149980426712411];

G_LP = [0.151979128902975;0.129750172914110;0.114707843847615;0.104788662978081;0.0987504716029469;0.0958902911270318;1];

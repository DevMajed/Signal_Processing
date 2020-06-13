# Band Pass filter and synthesizing Beethoven 5th symphony  


In an previous project i synthesized Beethoven's 5th symphony, and in this project i want to test a band pass filter with it.\
First, i dseigned the Band Pass Filter in Matlab with the following specification
<img width="516" alt="Screen Shot 2020-06-03 at 9 45 56 AM" src="https://user-images.githubusercontent.com/57555013/83644285-1cc00f80-a57f-11ea-8bce-ab87499cdea1.png">

After creating the filter, the two variables G_BAND and SOS_BAND were saved and then they were loaded to the script file BandPass.m in order to use them to filter the melody.\
Next, i got my cong synthesis code, which start by asigning the frequency of each note and the rests to variables. The melody before filtering will be played using soundsc(melody) "commented in my code" and then the filtering will be applied and the spectrogram before and after filtering will be as shown bellow.
The spectrogram before filtering:

<img width="609" alt="Screen Shot 2020-06-03 at 10 00 37 AM" src="https://user-images.githubusercontent.com/57555013/83646021-22b6f000-a581-11ea-8c5c-29e499cb4667.png">

The spectrogram After filtering:

<img width="536" alt="Screen Shot 2020-06-03 at 10 06 14 AM" src="https://user-images.githubusercontent.com/57555013/83647016-69f1b080-a582-11ea-8f09-6594723ce435.png">



 

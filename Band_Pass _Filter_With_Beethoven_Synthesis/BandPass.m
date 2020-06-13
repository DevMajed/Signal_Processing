load('G_BAND')
load('SOS_BAND') 
SOSB=SOS_Band;
GB=[0.482720261878615;0.482720261878615;0.486143148355194;0.486143148355194;0.551524955645699;1];
s = 0.25;   % eighth
s2 = 0.75;
Asharp= 233.08;
B= 246.94;
C= 261.62;
Csharp= 277.18;
D= 293.66;
Dsharp = 311.12; 
EB= 311.1270;
F= 349.22;
G= 391.99;
t = [0:1/8192:(.25-1/8192)];
GG= 783.9800;

v= ones(1,9);

eight_note_rest1= genrest(0.25);
eight_note_rest2= genrest(0.08);
eight_note1= harmonics(G,s,9,v); 
half_note1= harmonics(EB, s2,9,v); 
eight_note4= harmonics(F,s,9,v);
half_note2= harmonics(D, s2,9,v); 

melody= [ eight_note_rest1, eight_note1,eight_note_rest2, eight_note1,eight_note_rest2, eight_note1...
   eight_note_rest2, half_note1,eight_note_rest1, eight_note4,eight_note_rest2, eight_note4,eight_note_rest2, eight_note4, eight_note_rest2, half_note2, eight_note_rest2];
 
% spectrogram Before Filtring
figure(1)
spectrogram(melody, 256, 196, 512 , 8192,'yaxis');
xlim([0 2]);
 ylabel('Magnitude in dB')
 xlabel('frequency  in Hz')

%soundsc(melody); 

Q=1;
for i = 1:6
    Q = GB(i)*Q;
end

ymel = sosfilt(SOSB, melody*Q);
figure(2)

% spectrogram After Filtring
spectrogram(ymel, 256, 196, 512 , 8192,'yaxis');
xlim([0 2]);
 ylabel('Magnitude in dB')
 xlabel('frequency  in Hz')

 soundsc(ymel); 



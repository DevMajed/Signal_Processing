clc


% creating the test signal 
t = 0:1/8192:2;
v= ones(1,40) ;
x =  (harmonics(100,2,40, v))



 X = fft(x)
 Faxis=linspace (0, 8196, 16385);
 mag2db(abs(X))
 dBX = mag2db(abs(X));
 
 figure(1)
 plot(Faxis,dBX )
 xlim([0 8000])
 ylim([0 100])
 ylabel('Magnitude in dB')
 xlabel('frequency  in Hz')

 figure
 plot(Faxis-4096, fftshift(dBX))
 xlim([-4096 4096])
 ylim([0 100])
 ylabel('Magnitude in dB')
 xlabel('frequency  in Hz')

 
  soundsc(x);


 
 
 

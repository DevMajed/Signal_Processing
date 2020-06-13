clear all 
faxis = linspace (0, 8196, 16385);
t = 0:1/8192:2;
v= ones(1,40) ;

SOS_LP = [1,2,1,1,-1.21471872152270,0.822635237134600;1,2,1,1,-1.03705005613104,0.556050747787483;1,2,1,1,-0.916821713829899,0.375653089220359;1,2,1,1,-0.837540994224741,0.256695646137065;1,2,1,1,-0.789279735192294,0.184281621604082;1,2,1,1,-0.766419262204284,0.149980426712411];
G_LP = [0.151979128902975;0.129750172914110;0.114707843847615;0.104788662978081;0.0987504716029469;0.0958902911270318;1];

% Fixing The shift in y due to the gain coef

x =  (harmonics(100,2,40, v))
y = sosfilt(SOS_LP, x);

G=1
for i = 1:7
    G = G_LP(i)*G
end

Y = fft(G*y)
dBY= mag2db(abs(Y))
YY= fft(y)

dBYY= mag2db(abs(YY))

 



 figure
 plot(faxis-4096, fftshift(dBY))
 xlim([-4096 4096]);
 ylim([0 100]);
 ylabel('Magnitude in dB')
 xlabel('frequency  in Hz')

 
 figure
 plot(faxis-4096, fftshift(dBYY))
 xlim([-4096 4096]);
 ylim([100 200]);
 ylabel('Magnitude in dB')
 xlabel('frequency  in Hz')

  soundsc(y);

 
 
 

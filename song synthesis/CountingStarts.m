clc;
clear all
fs=8192

A = 440.00; % Master Tuned to A 440
GS = A*2^(-1/12);
G = GS*2^(-1/12);
FS = G*2^(-1/12);
F = FS*2^(-1/12);
E = F*2^(-1/12);
DS = E*2^(-1/12);
D = DS*2^(-1/12);
CS = D*2^(-1/12); 
C = CS*2^(-1/12);
AS = A*2^(1/12);
B = AS*2^(1/12);


t = [0:1/fs:(.25-1/fs)];

% Basic version with ADSR smothing
gain=1;
rep1 =  [(gentone2(FS,.25, gain,1)) genrest(0.15) gentone2(GS,.25, gain,1) genrest(0.15) gentone2(B,.25, gain,1) genrest(0.15) gentone2(FS,.25, gain,1) genrest(0.15) gentone2(FS,.25, gain,1) genrest(0.15) gentone2(GS,.25, gain,1) genrest(0.15) gentone2(FS,.25, gain,1) genrest(0.15)  gentone2(E,.25, gain,1) genrest(0.15) gentone2(GS,.25, gain,1) genrest(0.15)]; 
rep2 =  [(gentone2(FS,.25, gain,1)) genrest(0.15) gentone2(FS,.25, gain,1) genrest(0.15) gentone2(GS,.25, gain,1) genrest(0.15) gentone2(A,.25, gain,1) genrest(0.15) gentone2(GS,.25, gain,1) genrest(0.15) gentone2(FS,.25, gain,1) genrest(0.15) gentone2(E,.25, gain,1) genrest(0.15)  gentone2(GS,.25, gain,1) genrest(0.15) gentone2(CS,.25, gain,1) genrest(0.15) gentone2(E,.25, gain,1) genrest(0.15) ]; 
rep3 =  [(gentone2(E,.25, gain,1)) genrest(0.15) gentone2(FS,.25, gain,1) genrest(0.15) gentone2(GS,.25, gain,1) genrest(0.15) gentone2(B,.25, gain,1) genrest(0.15) gentone2(FS,.25, gain,1) genrest(0.15) gentone2(FS,.25, gain,1) genrest(0.15) gentone2(GS,.25, gain,1) genrest(0.15)  gentone2(FS,.25, gain,1) genrest(0.01) gentone2(E,.25, gain,1) genrest(0.15) gentone2(GS,.25, gain,1) genrest(0.15)]; 
rep4 =  [(gentone2(FS,.25, gain,1)) genrest(0.15) gentone2(FS,.25, gain,1) genrest(0.15) gentone2(GS,.25, gain,1) genrest(0.15) gentone2(A,.25, gain,1) genrest(0.15) gentone2(GS,.25, gain,1) genrest(0.15) gentone2(FS,.25, gain,1) genrest(0.15) gentone2(E,.25, gain,1) genrest(0.15)  gentone2(GS,.25, gain,1) genrest(0.01) gentone2(FS,.25, gain,1) genrest(0.15) gentone2(FS,.25, gain,1) genrest(0.15) gentone2(CS,.25, gain,1) genrest(0.15) gentone2(E,.25, gain,1) genrest(0.15) ]; 
rep5 =  [(gentone2(CS,.25, gain,1)) genrest(0.15) gentone2(GS,.25, gain,1) genrest(0.15) gentone2(FS,.25, gain,1) genrest(0.15)  gentone2(FS,.25, gain,1) genrest(0.15) gentone2(E,.25, gain,1) genrest(0.15) gentone2(E,.25, gain,1) genrest(0.15)  gentone2(CS,.25, gain,1) genrest(0.15)]; 
figure
melody= [rep1 rep2 rep3 rep4 rep5];
figure
spectrogram (melody,256,196, 512 , 8192,'yaxis');
%soundsc(melody);
figure
plot(melody)




% adding ECHOO
echo = zeros(1,5);

Samp=[];
echo = zeros (1, 2*8192 );
echo(1)    =1;
echo(4096)  =0.008;
echo(8192)    =0.0028;
echo(12288)  =0.0125;
echo(163844)    =0.00065;
echomelody=conv(echo,melody);
%soundsc(echomelody);

v=[ 1 1 1 1 1 1 1 1 1];

% adding e 9th harmonics2
rep1H =  [(harmonics2(FS,.25,9, v,1)) genrest(0.1) harmonics2(GS,.25, 9,v,1) genrest(0.1) harmonics2(B,.25,9,v,1) genrest(0.1) harmonics2(FS,.25,9,v,1) genrest(0.1) harmonics2(FS,.25, 9,v,1) genrest(0.1) harmonics2(GS,.25, 9,v,1) genrest(0.1) harmonics2(FS,.25, 9,v,1) genrest(0.1)  harmonics2(E,.25,9,v,1) genrest(0.1) harmonics2(GS,.25, 9,v,1) genrest(0.1)]; 
rep2H =  [(harmonics2(FS,.25,9,v,1)) genrest(0.1) harmonics2(FS,.25, 9,v,1) genrest(0.1) harmonics2(GS,.25, 9,v,1) genrest(0.1) harmonics2(A,.25, 9,v,1) genrest(0.1) harmonics2(GS,.25, 9,v,1) genrest(0.1) harmonics2(FS,.25, 9,v,1) genrest(0.1) harmonics2(E,.25, 9,v,1) genrest(0.1)  harmonics2(GS,.25, 9,v,1) genrest(0.1) harmonics2(CS,.25, 9,v,1) genrest(0.1) harmonics2(E,.25, 9,v,1) genrest(0.1) ]; 
rep3H =  [(harmonics2(E,.25, 9,v,1)) genrest(0.1) harmonics2(FS,.25, 9,v,1) genrest(0.1) harmonics2(GS,.25, 9,v,1) genrest(0.1) harmonics2(B,.25, 9,v,1) genrest(0.1) harmonics2(FS,.25, 9,v,1) genrest(0.1) harmonics2(FS,.25, 9,v,1) genrest(0.1) harmonics2(GS,.25, 9,v,1) genrest(0.1)  harmonics2(FS,.25, 9,v,1) genrest(0.08) harmonics2(E,.25, 9,v,1) genrest(0.1) harmonics2(GS,.25, 9,v,1) genrest(0.1)]; 
rep4H=  [(harmonics2(FS,.25, 9,v,1)) genrest(0.1) harmonics2(FS,.25, 9,v,1) genrest(0.1) harmonics2(GS,.25, 9,v,1) genrest(0.1) harmonics2(A,.25, 9,v,1) genrest(0.1) harmonics2(GS,.25, 9,v,1) genrest(0.1) harmonics2(FS,.25, 9,v,1) genrest(0.1) harmonics2(E,.25, 9,v,1) genrest(0.1)  harmonics2(GS,.25, 9,v,1) genrest(0.08) harmonics2(FS,.25, 9,v,1) genrest(0.1) harmonics2(FS,.25, 9,v,1) genrest(0.1) harmonics2(CS,.25, 9,v,1) genrest(0.1) harmonics2(E,.25, 9,v,1) genrest(0.1) ]; 
rep5H =  [(harmonics2(CS,.25, 9,v,1)) genrest(0.1) harmonics2(GS,.25, 9,v,1) genrest(0.1) harmonics2(FS,.25, 9,v,1) genrest(0.1)  harmonics2(FS,.25, 9,v,1) genrest(0.1) harmonics2(E,.25, 9,v,1) genrest(0.1) harmonics2(E,.14, 9,v,1) genrest(0.1)  harmonics2(CS,.14, 9,v,1) genrest(0.1)]; 
Hmelody= [rep1H rep2H rep3H  rep4H rep5H];
echoHmelody = conv(echo,Hmelody);
%soundsc(echoHmelody);

SOS_LP = [1,2,1,1,-1.21471872152270,0.822635237134600;1,2,1,1,-1.03705005613104,0.556050747787483;1,2,1,1,-0.916821713829899,0.375653089220359;1,2,1,1,-0.837540994224741,0.256695646137065;1,2,1,1,-0.789279735192294,0.184281621604082;1,2,1,1,-0.766419262204284,0.149980426712411];
G_LP = [0.151979128902975;0.129750172914110;0.114707843847615;0.104788662978081;0.0987504716029469;0.0958902911270318;1];

QQ=1;
for i = 1:6
    QQ = G_LP(i)*QQ;
end


Filterdsong = sosfilt(SOS_LP, QQ*echoHmelody);
soundsc(Filterdsong);

figure 
spectrogram (Filterdsong,256,196, 512 , 8192,'yaxis');
figure
plot(Filterdsong)





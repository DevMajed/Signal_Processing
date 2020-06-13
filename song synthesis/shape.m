function ADSR = shape(duration)

 
A = 0.06;
A=linspace(0,2,round ((0.04.*8192)));
D=linspace(2,1.5,round ((0.02.*8192)));
R=linspace(1.5,0,round ((0.02.*8192)));

S=linspace(1.5,1.5, (duration*8192) - (length(A)+length(D)+length(R)));

ADSR=[ A D S R ];



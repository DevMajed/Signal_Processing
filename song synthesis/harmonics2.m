function Y = harmonics2(frequency,Duration,N,A_vect,shape)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

Y = 0 ; 
 for n= 1:1:N
     note = gentone2(frequency.*n,Duration,A_vect(n),shape);
    
    Y= Y+note;
    
    
    
 end
end


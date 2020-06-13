function Y = harmonics(frequency,Duration,N,A_vect)

Y = zeros(size(Duration));

Y = 0 ;
 for n= 1:1:N
     note = gentone(frequency.*n,Duration,A_vect(n));
    
    Y= Y+note;
    

    
 end
end 


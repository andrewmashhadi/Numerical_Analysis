i = 2;
p0 = pi/4;
p1 = pi*(3/8);
q0 = sin(p0) - p0;
q1= sin(p1) - p1;
x=1:1000;
vector = zeros(1, 1000);
vector(1)= q0;
vector(2) = q1;
while (i<=1000)
    p = p1-q1*((p1-p0)/(q1-q0));
   if (abs(p-p1)<.00001)
        disp(p)
        vector = vector(1:i);
        x = x(1:i);
        break
    end
    i=i+1;
    p0=p1;
    q0=q1;
    p1=p;
    q1=sin(p) - p;
    vector(i)= p; 
    
end
if(abs(p-p1)>=.00001)
    disp(p)
end
    plot(x, vector, 'r.')
 


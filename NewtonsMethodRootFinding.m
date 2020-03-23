i = 1;
p0 = pi/4;
f = sin(p0) - p0;
fprime= cos(p0)-1;
x=1:1000;
vector = zeros(1, 1000);
vector(1)= f;
while (i<1000)
    p = p0- f/fprime;
   if (abs(p-p0)<.00001)
        disp(p)
        vector = vector(1:i);
        x = x(1:i);
        break
    end
    i=i+1;
    p0=p;
    vector(i)= p; 
    f = sin(p) - p;
    fprime = cos(p)-1;
end
if(abs(p-p0)>=.00001)
    disp(p)
end
    plot(x, vector, 'r.')
function w = Heuns_Method(f, a, b, in_val, h) 

% Arguments are f(t, y) = dy/dt, in_val = y(a), h = t(i+1) - t(i) 

N = (b-a)/h;
w = in_val;
t = a;

for i = 1:N
   k1 = f(t, w);
   k2 = f(t + (h/3), w +((h*k1)/3));
   k3 = f(t + ((2*h)/3), w + ((2*h*k2)/3));
   k4 = k1 + (3*k3);
   w = w + (h*k4)/4;
   t = a+(i*h);
end

end

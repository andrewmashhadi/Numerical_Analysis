function w = Eulers_Method(f, a, b, in_val, h) 

% Arguments are f(t, y) = dy/dt, in_val = y(a), h = t(i+1) - t(i)

N = (b-a)/h;
w = in_val;
t = a;

for i = 1:N
   w = w + h*f(t, w);
   t = a+(i*h);
end

end

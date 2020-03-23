function w = Modified_Eulers_Method(f, a, b, in_val, h)

% Arguments are f(t, y) = dy/dt, in_val = y(a), h = t(i+1) - t(i)

N = (b-a)/h;
w = in_val;
t = a;

for i = 1:N
   k1 = f(t, w);
   k2 = f(t + h, w +(h*k1));
   k3 = k1 + k2;
   w = w + (h*k3)/2;
   t = a+(i*h);
end

end
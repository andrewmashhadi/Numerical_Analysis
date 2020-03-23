% Euler's and Taylor's Method (2nd order)
a = 0;
b = 1;
EUL_VALS = [];
TAY_VALS = [];
f = @(t, y) (y.^2).*exp(-t);
f_prime = @(t, y) -(y.^2).*(exp(-t)) + 2*(y.^3).*exp(-2*t);  
for h = [0.5, 0.1, 0.01]
    w = 1;
    u = 1;
    for t = a:h:(b-h)
        w = w + (h *(f(t,w)));
        u = u + (h *(f(t,u))) + ((h^2)*(f_prime(t,u)))/2;
    end
    EUL_VALS = [EUL_VALS, w];
    TAY_VALS = [TAY_VALS, u];
end
EUL_VALS = EUL_VALS';
TAY_VALS = TAY_VALS';

disp("Euler's Method Approximations for y(1) with h = 0.5, 0.1, 0.01");
EUL_VALS
disp("Taylor's Method (Order 2) Approximations for y(1) with h = 0.5, 0.1, 0.01");
TAY_VALS



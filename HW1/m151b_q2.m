% Eulers Method 
a = 1;
b = 2;
ANS_VALS = [];
f = @(t, y) (1 + t)/(1 + y);
for h = [0.5, 0.2, 0.1, 0.01]
    w = 2;
    for t = a:h:(b-h)
        w = w + (h *(f(t,w)));
    end
    ANS_VALS = [ANS_VALS, w];
end
ANS_VALS



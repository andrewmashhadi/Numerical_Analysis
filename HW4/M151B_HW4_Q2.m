% Preditor-Corrector for Dffq Order Two IVP

f1 = @(t, y1, y2) y2;
f2 = @(t,y1, y2) 4*y1 + 6*exp(-t);

f = {f1, f2};
b = 1;
a = 0;
h = 0.1;
w = PCM_Order_Two(f, a, b, h, 0, 0);
w

    

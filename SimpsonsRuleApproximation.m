function result = SimpsonsRuleApproximation(N)
a = 0;
b = pi;
h = (b-a)/N;
Xeven = 0;
Xodd = 0;
f = @(x) cos(x);
for i = 1:N-1
     X = a+i*h;
     if (mod(i,2) == 0)
         Xeven = Xeven + f(X);
     else
         Xodd = Xodd + f(X);
     end   
end
result = h/3*(f(a) + 2*Xeven + 4*Xodd + f(b));
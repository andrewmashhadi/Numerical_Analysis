function result = TrapezoidalRuleApproximation(N)
a = 0;
b = pi;
h = (b-a)/N;
sum = 0;
f = @(x) cos(x);
for i = 1:N-1
    sum = sum + f(a + i*h);
    
end
result = h/2*(f(a)+ 2*sum + f(b));




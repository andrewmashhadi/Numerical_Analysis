DinvLU = [0, .5; (1/3), 0];
Dinvb = [.5, (1/3)]';
X = [1, 1]';
Y1 = ones(1,20);
Y2 = ones(1,20);
for n = 1:19
    
    X = Dinvb - DinvLU*X;
    Y1(n+1) = X(1);
    Y2(n+1) = X(2);
end
disp(X);
C = 1:1:20;
plot(C, Y1);
hold on;
plot(C, Y2);
% Using the IVP, dy/dt = y + t^2 + 1 with y(0) = 0 for t in [0,1], given to 
% us in lecture, instead of the IVP from question one.
f = @(t, y) y + t^2 + 1;
a = 0;
b = 1;
y_0 = 0;

% The exact solution, using integrating factor techniques, is y(1) = 3*e - 6.
y_1 = 3*exp(1) - 6;

% Using step sizes for h (different number of mesh points).
h = [0.01, 0.02, 0.04, 0.05, 0.1, 0.2, 0.25, 0.5, 1] ;

% Array structure holding IVP approximations for each h level.
w(length(h)) = struct('heuns',[], 'eulers',[], 'modified', []);

for k = 1:length(h)
    w(k).heuns = Heuns_Method(f, a, b, y_0, h(1, k));
    w(k).eulers  = Eulers_Method(f, a, b, y_0, h(1, k));
    w(k).modified = Modified_Eulers_Method(f, a, b, y_0, h(1, k));
    
    disp(['Euler''s Method with h = ' num2str(h(1,k)) ': y(1) = ', num2str(w(k).eulers)]);
    disp(['Modified Euler''s Method with h = ' num2str(h(1,k)) ': y(1) = ', num2str(w(k).modified)]);
    disp(['Heun''s Method with h = ' num2str(h(1,k)) ': y(1) = ', num2str(w(k).heuns)]);
        
end

% Arrays of approxiamtions for each method with different h values.
huens_v = [w(1:length(h)).heuns];
eulers_v = [w(1:length(h)).eulers];
modified_v = [w(1:length(h)).modified];

% Arrays of each method's error for each h value.
Error_heuns = abs((y_1*ones(1, length(h)))- huens_v);
Error_eulers = abs((y_1*ones(1, length(h)))- eulers_v);
Error_modified = abs((y_1*ones(1, length(h)))- modified_v);

% Plotting error vs h values for each method on the same plot.
plot(h,Error_heuns, h, Error_eulers, h, Error_modified, 'Linewidth', 2)
title('Comparing Error in Methods')
xlabel('h')
ylabel('Error')
legend('Heuns Method', 'Eulers Method', 'Modified Eulers Method')
N = 100;
b = 1;
a = 0;
h = (b-a)/N;
A = zeros(N);
b = (0:h:(1-h))';
b = (-4*b).*h^2;
b(N, 1) = b(N) - 1;
A(1, 1:3) = [-3, 4, -1];

for i = 2:N-1
   A(i,(i-1):(i+1)) = [1, -2-4*h^2, 1];
end
A(N, [N-1, N]) = [1, -2-4*h^2];
w = linsolve(A, b);
w(N+1, 1) = 1;

figure()
plot(0:h:1, w)
xlabel('x')
ylabel('w')
title('Approximate Solution of the BVP')

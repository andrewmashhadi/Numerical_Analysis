h = 1/8;
alpha = 1/2;
beta = 1/3;
a = -1;
b = 0;
TOL = 10^-7;

% Initial approxiamtion assumes linear solution
w = zeros(7, 1);
for j = 1:7
    w(j, 1) = alpha + j*h*(beta-alpha)/(b-a);
end

% Fill the Jacobian calculated by hand
J_0 = zeros(7, 7);
for i = 1:7
   J_0(i, i) = -2-6*(h^2)*w(i, 1);
end

% Fill off-diagonals 
for k = 1:6
    J_0(k, k+1) = 1;
    J_0(k+1, k) = 1;
end

A_0 = J_0;
v = F(w);

A_inv = inv(A_0);

s = -A_inv*v;

% First step approximation
w = w+s;

k = 2;

while (k<=7)
    v_prev = v;
    v = F(w);
    y = v-v_prev;
    
    z = -A_inv*y;
    p = -s'*z;
    
    u = (s')*A_inv;
    
    % Using the Sherman- Morrison Formula to update the inverse
    A_inv = A_inv + (1/p)*(s + z)*u;
    
    % Update the next step's approximation
    s = -A_inv*v;
    w = w + s;
    
    % If step size becomes too small 
    s_norm = sqrt(sum(s.^2));
    if (s_norm < TOL)
        w = [1/2, w', 1/3]';
        w
        break
    end
    k = k+1;
end

% Exact solution
y = @(x) 1./(x+3);

% Compare our approximation with exact solution
figure()
x = -1:h:0;
plot(x, w, '-.', 'LineWidth',3)
hold on
plot(x, y(x), 'LineWidth',1)
hold off
axis([-1, 0, 0 1])
title('Approximate and Exact Solution')
xlabel('x')
ylabel('y and w')
legend('Approximate Solution', 'Exact Solution')
hold off


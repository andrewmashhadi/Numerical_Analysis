% Create a vector of theta values
theta = (0:0.001:(2*pi))';
L = length(theta);

% 1+z+(0.5z^2)-(e^(i(theta))=0 ==> z^2 + 2z + (2-2e^(i(theta))=0,
% so we want a, b, c for az^2 + bz + c quadratic

a = ones(L, 1);
b = 2.*ones(L, 1);
c = 2-2*exp(1j.*(theta));

% Matrix of all different quadratic equations for varying theta
M = [a, b, c];

% Find the roots for each row of M
z = zeros(L, 2);
for i=1:L
    Two_roots = roots(M(i, :));
    z(i, 1) = Two_roots(1, 1);
    z(i, 2) = Two_roots(2, 1);
end

z = reshape(z, [2*L, 1]);
z_re = real(z);
z_img = imag(z);

% Plot the border of the region of absolute stability
plot(z_re,z_img,'--b', 'LineWidth', 3)
hold on

% Fill in the region of absolute stablity
patch(z_re',z_img', 'blue')
title('Region of Absolute Stability for Midpoint Method')
xlabel('Re(z)') 
ylabel('Im(z)') 
grid on
axis equal
ax = gca;
ax.XLim = [-3, 3];
ax.YLim = [-3, 3];
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
hold off



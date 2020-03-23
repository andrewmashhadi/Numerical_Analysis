% Describes the boundary for fimplicit function
sb = @(a, b) (a+1).^2 + b.^2 - 1;

fimplicit(sb, [-3, 3, -2, 2],'--b', 'LineWidth', 3)
hold on

% Fill the inside of the border of the 
% region of absolute stability.
x = -2:0.01:0;
x_rev = 0:-0.01:-2;
y_top = sqrt(1-(x+1).^2);
y_bottom = -sqrt(1-(x+1).^2);

x = [x, x_rev];
y = [y_top, y_bottom];
patch(x, y, 'blue')
title('Region of Absolute Stability for Euler''s Method')
xlabel('Re(z)') 
ylabel('Im(z)') 
grid on
axis equal
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';

hold off



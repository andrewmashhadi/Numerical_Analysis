x = [1; 1; 1];
J = zeros(3, 3);

x_4steps = zeros(3, 1);

% Four steps of Newton's Method
for i = 1:8
    
    % Better way to do this? Feels like too much hard-coding...
    J(1, 1) = 2*x(1, 1);
    J(1, 2) = 1;
    J(2, 1) = 1;
    J(2, 2) = -2*x(2, 1);
    J(3, :) = [1, 1, 1];
    
    f1 = (x(1, 1)^2)+x(2, 1)-37;
    f2 = x(1, 1)-(x(2, 1)^2)-5;
    f3 = x(1, 1)+x(2,1)+x(3,1)-3;
    F = [f1, f2, f3]';
    
    y = linsolve(J, -F);
    
    x = x + y;
    
    if (i == 4)
        x_4steps = x;
    end
    
end

x_8steps = x;

disp('Four Step''s of Newton''s Method')
x_4steps

disp('Eight Step''s of Newton''s Method')
x_8steps


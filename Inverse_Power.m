function Inverse_Power(A, q)

% Set tolerance level
TOL = 10^-5;

% Randon initial guess for eigenvector
x = [1; 1; 1];

m_x = max(abs(x));
p = 1;
for i = 1:length(x)
    if (abs(x(i, 1)) == m_x)
        p = i;
        break;
    end
end

x = x./m_x;

while(true)
    
    % Check to make sure (A-qI)y = x is solvable
    if (det(A-q*eye(3)) == 0)
        disp(['q = ' num2str(q) 'is an eigenvalue']);
        break;
    end
    
    % Solving (A-qI)y = x to get y
    y = linsolve((A-q*eye(3)), x);
   
    mu = y(p, 1);
    
    m_y = max(abs(y));   
    
    for j = 1:length(y)
        if (abs(y(j, 1)) == m_y)
            p = j;
            break;
        end
    end
    
    % Find the error using L-infinity norm, ||x-(y/y_p)||
    ERR = max(x-(y./y(p,1)));
    x = y./y(p,1);
    
    if (ERR < TOL)
        lambda = (1/mu) + q;
        disp(['Eigenvalue closest to q = ' num2str(q)']);
        lambda
        disp("Corresponding eigenvector");
        x
        break;
    end
end

end


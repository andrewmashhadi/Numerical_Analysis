% Trying TOL values 10^-2, 10^-5, 10^-8

for i = [2, 5, 8]
    
    TOL = 10^-i;
    x = [1; 1; 1];
    
    Iteration_count = 1;
    while(true)
        g1 = g(x);
        z = Del_g(x);
        
        % L2-norm of gradient 
        z0 = sqrt(sum(z.^2));

        if (z0 == 0)
            disp('Zero Gradient')
            x 
            g1
            break;
        end

        % Make z a unit vector before finding alpha in (0,1)
        z = (1/z0)*z;
        a1 = 0;
        a3 = 1;
        g3 = g((x-a3*z));

        % Find alpha3 such that h(alpha3)< h(alpha1)  
        while (g3 >= g1)
            a3 = a3/2;
            g3 = g(x-a3*z);
            
            % If alpha3 becomes too small, the next step will have little
            % improvment
            if (a3 < TOL/2)
                disp('No likely improvement');
                x
                g1
                break;
            end
        end

        a2 = a3/2;
        g2 = g(x-a2*z);

        % Setting up divided difference interpolation of h(alpha)
        h1 = (g2-g1)/a2;
        h2 = (g3-g2)/(a3-a2);
        h3 = (h2-h1)/a3;

        % Critical point of interpolating polynomial
        a_crit = 0.5*(a2-h1/h3);
        g_crit = g(x-a_crit*z);

        g_best = min([g_crit, g3]);

        %Pre-define best alpha
        a_min = 0;
        if (g_best == g_crit)
            a_min = a_crit;
        else 
            a_min = a3;
        end

        x = x-a_min*z;

        % If this newest iteration of g did not get much better
        if (abs(g_best-g1) <= TOL)
            disp(['Steepest Descent Approximation with TOL = ' num2str(TOL) ':']);
            x
            g1
            
            disp('Computing F(x) we get');
            F_x = [(x(1,1)^3)+(x(1,1)^2)*x(2,1)-x(1,1)*x(3,1)+6, (exp(x(1,1))+ ...
                   exp(x(2,1))-x(3,1)), ((x(2,1)^2)-2*x(1,1)*x(3,1)-4)]'
               
            disp('Number of Iterations')
            Iteration_count
            break;
        end    
        Iteration_count = Iteration_count+1;
    end
end
function RKF12(f, a, b, initial, h_max, h_min, i_tol)

count_steps = 0;        
done = false;
h = h_max;
TOL = i_tol;
t = a;
w = initial;

while(~done)
    
    k1 = h*f(t, w);
    k2 = f(t+h, w + k1);
    
    R = abs(h*k2/2 - k1/2)/h;        % R = |W_tilda(i+1) - W(i+1)|/h
    if (R <= TOL)
        w = w + k1;
        t = t+h;
    end
    
    q = (TOL/R);           
    
    if (q < 0.1)            % Minimum q-level is 0.1
        h = 0.1*h;
    elseif (q*h > h_max)          
        h = h_max;
    else
        h = q*h;
    end
    
    if (t >= b)
        done = true;
    elseif ((t+h)>b)
        h = b-t;
     elseif (h < h_min)
        disp("Minimum h exceeded");
        break;
    end
    
    count_steps = count_steps + 1;
end

if (done)
disp(['RKF12 Method''s Approximation for y(' num2str(b) '): ' num2str(w)]); 
disp(['Number of Timesteps required: ' num2str(count_steps)]); 
end

end
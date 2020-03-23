function RKF45(f, a, b, initial, h_max, h_min, i_tol)

count_steps = 0;        
done = false;
h = h_max;
TOL = i_tol;
t = a;
w = initial;

while(~done)
    
    k1 = h*f(t, w);
    k2 = h*f(t+h/4, w + k1/4);
    k3 = h*f(t +(3*h)/8,w +(3*k1)/32 + (9*k2)/32);
    k4 = h*f(t +(12*h)/13, w +(1932*k1)/2197 - (7200*k2)/2197 + (7296*k3)/2197);
    k5 = h*f(t + h, w +(439*k1)/216 - 8*k2 + (3680*k3)/513 - (845*k4)/4104);
    k6 = h*f(t + h/2, w -(8*k1)/27  + 2*k2 - (3544*k3)/2565 + (1859*k4)/4104 - (11*k5)/40); 
    
    R = (1/h)*abs(k1/360 - (128*k3)/4275 - (2197*k4)/75240 + k5/50 + (2*k6)/55);        % R = |W_tilda(i+1) - W(i+1)|/h
    if (R <= TOL)
        w = w + (25*k1)/216 +(1408*k3)/2565 + (2197*k4)/4104 - k5/5;
        t = t+h;
    end
    
    q = (TOL/R)^(0.25);          
    
    if (q < 0.1)            
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
disp(['RKF45 Method''s Approximation for y(' num2str(b) '): ' num2str(w)]); 
disp(['Number of Timesteps required: ' num2str(count_steps)]); 
end

end

% Using y' = 1+y with [0,1] and y(0) = -0.5
% Solution is y(t) = 0.5e^t - 1, y(1) = 0.35914

f = @(t, y) 1 + y;      
a = 0;
b = 1;
initial = -0.5;
h_max = 0.25;
h_min = 0.00001;  

        
for TOL = [10^-2, 10^-3, 10^-4, 10^-5]
    disp(['TOLERANCE LEVEL: ' num2str(TOL)]);
    tic  % Start stopwatch.
    RKF12(f, a, b, initial, h_max, h_min, TOL);
    time_elapsed = toc; % Store Ellapsed Time.
    disp(['RUN-TIME: ' num2str(time_elapsed)]);
    
    tic  % Start stopwatch.
    RKF45(f, a, b, initial, h_max, h_min, TOL);
    time_elapsed = toc; % Store Ellapsed Time.
    disp(['RUN-TIME: ' num2str(time_elapsed)]);
    disp(newline);
end


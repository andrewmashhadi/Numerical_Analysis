function w = PCM_Order_One(f, a, b, h, init)

N = (b-a)/h;
t = zeros(1, N+1);
w = zeros(1, N+1);
t(1, 1) = a;
w(1, 1) = init; 

    for i = 2:(N+1)
       t_temp = a+(i-1)*h;
       k1 = h*f(t(1, i-1), w(1, i-1));
       k2 = h*f(t(1, i-1)+h/2, w(1, i-1)+k1/2);

       % Predictor
       w_temp = w(1, i-1)+k2;
       
       % Corrector
       w_temp = w(1, i-1)+(h/2)*f(t_temp, w_temp)+(h/2)*f(t(1, i-1), w(1, i-1)); 

       t(1, i) = t_temp;
       w(1, i) = w_temp;
    end
end

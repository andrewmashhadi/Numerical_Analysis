function w = PCM_Order_Two(f, a, b, h, init1, init2)

N = (b-a)/h;
t = zeros(N+1);
w = zeros(2, N+1);
t(1) = a;
w(1, 1) = init1; 
w(2, 1) = init2;

for j = 2:(N+1)

    t(j) = a + (j-1)*h; 

    k1 = zeros(2);
    for u = 1:2
        k1(u) = h*(f{u}(t(j-1), w(1, j-1), w(2, j-1)));
    end

    k2 = zeros(2);
    for u = 1:2
        k2(u) = h*(f{u}(t(j-1)+h/2, w(1, j-1)+k1(1)/2, w(2, j-1)+k1(2)/2));
    end

    % Predictions for u1 and u2
    for u = 1:2
        w(u, j) = w(u, j-1) + k2(u);
    end

    % Corrections for u1 and u2
    for u = 1:2
        w(u, j) = w(u, j-1)+(h/2)*(f{u}(t(j), w(1, j), w(2, j)))+(h/2)*(f{u}(t(j-1), w(1, j-1), w(2,j-1)));
    end

end

end
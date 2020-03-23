g_2 = zeros(1,10000);
c = -1;
i = 1;
while (c <= 1)
    g_2(i) = LaGrangeInterpolation(c, 2);
    i = i+1;
    c = c +.01;
end
g_2 = g_2(1:i);

x=-1:.01:1;

plot(x,g_2);
hold on 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

g_3 = zeros(1,10000);
c = -1;
i = 1;
while (c <= 1)
    g_3(i) = LaGrangeInterpolation(c, 3);
    i = i+1;
    c = c +.01;
end
g_3 = g_3(1:i);

x=-1:.01:1;

plot(x,g_3);
hold on 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

g_4 = zeros(1,10000);
c = -1;
i = 1;
while (c <= 1)
    g_4(i) = LaGrangeInterpolation(c, 4);
    i = i+1;
    c = c +.01;
end
g_4 = g_4(1:i);

x=-1:.01:1;

plot(x,g_4);
hold on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

g_5 = zeros(1,10000);
c = -1;
i = 1;
while (c <= 1)
    g_5(i) = LaGrangeInterpolation(c, 5);
    i = i+1;
    c = c +.01;
end
g_5 = g_5(1:i);

x=-1:.01:1;

plot(x,g_5);
hold on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

plot(x, abs(x));


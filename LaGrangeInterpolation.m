function sum = LaGrangeInterpolation(t, n)
x=zeros(1, n+1);
for i=1:n+1
    x(i)=-1+2*(i-1)/n;
end
sum = 0;
L = ones(1, n+1);
for i=1:length(x)
    c = ones(1,n+1);
    for j=1:length(x)
        if j~=i
            c(j) = (t-x(j))/(x(i)-x(j));
        end
        L(i)= L(i)*c(j);
    end
    term = abs(x(i))*L(i);
    sum = sum + term;
end

%disp(sum);

end

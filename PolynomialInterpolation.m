function sum = PolynomialInterpolation(a, MatrixOfPoints)

x = MatrixOfPoints(:,1);
f = MatrixOfPoints(:,2);
sum = 0;
L = ones(1, length(x));
for i=1:length(x)
    c = ones(1,length(x));
    for j=1:length(x)
        if j~=i
            c(j) = (a-x(j))/(x(i)-x(j));
        end
        L(i)= L(i)*c(j);
    end
    term = (f(i))*L(i);
    sum = sum + term;
end
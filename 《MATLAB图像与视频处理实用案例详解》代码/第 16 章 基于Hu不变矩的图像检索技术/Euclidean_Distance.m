function value = Euclidean_Distance(X, Y)
[r, c] = size(X);     
e = [];
for i = 1:c
    e(i) = (X(i)-Y(i))^2;
end
Euclid = sqrt(sum(e));
value = Euclid;

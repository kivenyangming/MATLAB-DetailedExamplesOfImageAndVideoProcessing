function value = Compute_SimMat(I, J)
[r, c] = size(I);
A = [];
for i = 1:r
    for j = 1:r
        M1 = (I(i, 2) * sin(I(i, 1)) - J(j, 2) * sin(J(j, 1)))^2;
        M2 = (I(i, 2) * cos(I(i, 1)) - J(j, 2) * cos(J(j, 1)))^2;
        M3 = (I(i, 3) - J(j, 3))^2;        
        M0 = sqrt(M1 + M2 + M3);        
        A(i, j) = 1 - (M0/sqrt(5));  
    end
end      
value = A;

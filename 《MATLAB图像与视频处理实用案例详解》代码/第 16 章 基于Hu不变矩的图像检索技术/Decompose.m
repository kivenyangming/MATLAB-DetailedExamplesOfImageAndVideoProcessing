function [Tl, Tr, Bl, Br] = Decompose(imMatrix)
[A,B,C,D] = dwt2(imMatrix,'db1');
Tl = wcodemat(A);      
Tr = wcodemat(B);       
Bl = wcodemat(C);       
Br = wcodemat(D);     
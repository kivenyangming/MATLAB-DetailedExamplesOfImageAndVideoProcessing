function value = Energy_Level(aMatrix)
[r, c] = size(aMatrix);
value = sum(sum(abs(aMatrix)))/(r*c);
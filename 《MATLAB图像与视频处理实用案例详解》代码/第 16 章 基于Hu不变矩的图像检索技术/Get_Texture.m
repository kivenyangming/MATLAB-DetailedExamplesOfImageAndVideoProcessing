function value = Get_Texture(iMatrix, n)
dm = iMatrix;   
energies = [];
i = 1;
for j = 1:5
    [tl, tr, bl, br] = Decompose(dm);
    energies(i) = Energy_Level(tl);   
    energies(i+1) = Energy_Level(tr);
    energies(i+2) = Energy_Level(bl);
    energies(i+3) = Energy_Level(br);    
    i = i + 4;
    dm = tl;
end
sorted = -sort(-energies);    
value = sorted(1:n);
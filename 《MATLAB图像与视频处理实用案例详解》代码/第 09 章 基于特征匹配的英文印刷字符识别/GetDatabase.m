function GetDatabase
clc;
hf1 = figure;
imshow(zeros(32,32));
fontName = 'ËÎÌו';
fontSize = 18;
h = text(15, 15, 'a', 'Color', 'w', 'Fontname', fontName, 'FontSize', fontSize);

if ~exist('Database', 'dir')
    mkdir('Database');
end
chars = [char(uint8('A'):uint8('Z')), uint8('a'):uint8('z'), uint8('0'):uint8('9')];
eleLen = length(chars);
charpic = cell(1,eleLen);
for p = 1 : eleLen
    set(h, 'String', chars(p));
    fh = getframe(hf1, [85, 58, 30, 30]);
    temp = fh.cdata;
    temp = im2bw(temp);
    [f1, f2] = find(temp == 1);
    temp = temp(min(f1)-1:max(f1)+1,min(f2)-1:max(f2)+1);
    charpic{p} = temp;
end
delete(hf1);
for i = 1 : length(charpic)
    imwrite(charpic{i}, fullfile(pwd, sprintf('Database/%d.jpg', i)));
end

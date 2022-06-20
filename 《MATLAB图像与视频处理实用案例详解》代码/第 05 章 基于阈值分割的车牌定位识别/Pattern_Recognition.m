function str = Pattern_Recognition(words)

pattern = [];
dirpath = fullfile(pwd, '��׼��/*.bmp');
files = ls(dirpath);
for t = 1 : length(files)
    filenamet = fullfile(pwd, '��׼��', files(t,:));
    [~, name, ~] = fileparts(filenamet);
    imagedata = imread(filenamet);
    imagedata = im2bw(imagedata, 0.5);
    pattern(t).feature = imagedata;
    pattern(t).name = name;
end

distance = [];
for m = 1 : 7;
    for n = 1 : length(files);
        switch m
            case 1
                distance(n)=sum(sum(abs(words.word1-pattern(n).feature)));
            case 2
                distance(n)=sum(sum(abs(words.word2-pattern(n).feature)));
            case 3
                distance(n)=sum(sum(abs(words.word3-pattern(n).feature)));
            case 4
                distance(n)=sum(sum(abs(words.word4-pattern(n).feature)));
            case 5
                distance(n)=sum(sum(abs(words.word5-pattern(n).feature)));
            case 6
                distance(n)=sum(sum(abs(words.word6-pattern(n).feature)));
            case 7
                distance(n)=sum(sum(abs(words.word7-pattern(n).feature)));
        end
    end
    [yvalue,xnumber]=min(distance);
    filename = files(xnumber, :);
    [pathstr, name, ext] = fileparts(filename);
    result(m) = name;
end
str = ['ʶ����Ϊ��' result];
msgbox(str, '����ʶ��', 'modal');
str = result;

function [resultNames, index] = CoMatrix_Process(filename, flag)
if nargin < 2
    flag = 1;
end
if nargin < 1
    filename = '´ý¼ìË÷Í¼Ïñ\\im1.bmp';
end

resultValues = [];
resultNames = {};
files = ls('Í¼Æ¬¿â\\*.*');

[queryx, querymap] = imread(filename);
if isempty(querymap)
    [queryx, querymap] = rgb2ind(queryx, 256);
end
for i = 1 : size(files, 1)
    file = fullfile('Í¼Æ¬¿â\\', files(i, :));
    [pathstr, name, ext] = fileparts(file);
    if length(strtrim(ext)) > 3
        [X, RGBmap] = imread(file);
        HSVmap = rgb2hsv(RGBmap);
        D = Compute_QuadDistance(queryx, querymap, X, HSVmap);
        resultValues(end+1) = D;
        resultNames{end+1} = {file};
    end
end
[sortedValues, index] = sort(resultValues);
query = ind2rgb(queryx, querymap);
query = rgb2gray(query);
if flag
    figure;
    imshow(queryx, querymap);
    title('´ý¼ìË÷Í¼Ïñ', 'FontWeight', 'Bold');
    figure;
    set(gcf, 'units', 'normalized', 'position',[0 0 1 1]);
    for i = 1 : 10
        tempstr = cell2mat(resultNames{index(i)});
        [X, RGBmap] = imread(tempstr);
        img = ind2rgb(X, RGBmap);        
        subplot(2, 5, i); imshow(img, []);
        img = rgb2gray(img);
        dm = imabsdiff(query, img);
        df = (1-sum(dm(:))/sum(query(:)))*100;
        xlabel(sprintf('ÏàËÆ¶È£º%.2f%%', abs(df)), 'FontWeight', 'Bold');
        str = sprintf('¼ìË÷½á¹ûÅÅÐò%d', i);
        title(str, 'FontWeight', 'Bold');
    end
end
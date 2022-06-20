function [fresultNames, index] = Hu_Process(filename, Hu, resultNames, index, flag)
if nargin < 5
    flag = 1;
end

fresultValues = [];
fresultNames = {};
for i = 1 : 4
    file = cell2mat(resultNames{index(i)});
    [X, RGBmap] = imread(file);
    X = ind2rgb(X, RGBmap);
    I1 = Gray_Convert(X, 0);
    bw1 = Image_Binary(I1, 0);
    imageHu = Compute_HuNicolas(bw1);
    E = Euclidean_Distance(Hu, imageHu);
    fresultValues(i) = E;
    fresultNames{end+1} = file;
end
[queryx, querymap] = imread(filename);
if isempty(querymap)
    [queryx, querymap] = rgb2ind(queryx, 256);
end
query = ind2rgb(queryx, querymap);
query = rgb2gray(query);
[sortedValues, index] = sort(fresultValues);
if flag
    figure;
    set(gcf, 'units', 'normalized', 'position',[0 0 1 1], ...
        'Name', '灰度共生矩阵检索结果', 'NumberTitle', 'off');
    for i = 1:4
        tempstr = fresultNames{index(i)};
        [X, RGBmap] = imread(tempstr);
        img = ind2rgb(X, RGBmap);
        subplot(2, 2, i); imshow(img, []);
        img = rgb2gray(img);
        dm = imabsdiff(query, img);
        df = (1-sum(dm(:))/sum(query(:)))*100; 
        xlabel(sprintf('相似度：%.2f%%', abs(df)), 'FontWeight', 'Bold');
        str = sprintf('检索结果排序%d', i);
        title(str, 'FontWeight', 'Bold');
    end
end
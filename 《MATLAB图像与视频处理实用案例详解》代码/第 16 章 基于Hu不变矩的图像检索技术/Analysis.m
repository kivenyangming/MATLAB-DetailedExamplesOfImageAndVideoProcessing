function D = Analysis(filename, fresultNames, index, flag)
if nargin < 4
    flag = 1;
end
[queryx, querymap] = imread(filename);
if isempty(querymap)
    [queryx, querymap] = rgb2ind(queryx, 256);
end
query = ind2rgb(queryx, querymap);
query = rgb2gray(query);
D = [];
for i = 1:4
    tempstr = fresultNames{index(i)};
    [X, RGBmap] = imread(tempstr);
    img = ind2rgb(X, RGBmap);
    img = rgb2gray(img);
    dm = imabsdiff(query, img);
    df = sum(dm(:))/sum(query(:));
    D = [D df];
end
D = 1 - D;
if flag
    figure; box on;
    plot(D);
    title('�����������', 'FontWeight', 'Bold');
    xlabel('����������', 'FontWeight', 'Bold')    
    ylabel('����������ƶȱ���', 'FontWeight', 'Bold')
end
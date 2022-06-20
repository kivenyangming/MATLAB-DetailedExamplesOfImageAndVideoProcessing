function result = Plate_Process(plate, flag)

if nargin < 2
    flag = 1;
end
if ndims(plate) == 3
    plate1 = rgb2gray(plate);
else
    plate1 = plate;
end
Im = plate1;
bw = im2bw(Im);
h = fspecial('average', 2);
bw1 = imfilter(bw, h, 'replicate');
mask = Mask_Process(bw1);
bw2 = bw1 .* mask;
result = bw2;
if flag
    figure;
    subplot(2, 2, 1); imshow(plate); title('��������ͼ��', 'FontWeight', 'Bold');
    subplot(2, 2, 2); imshow(Im); title('��������У��ͼ��', 'FontWeight', 'Bold');
    subplot(2, 2, 3); imshow(bw1); title('���������ֵͼ��', 'FontWeight', 'Bold');
    subplot(2, 2, 4); imshow(bw2); title('�˲���ֵͼ��', 'FontWeight', 'Bold');
end
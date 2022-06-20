function bw1 = Image_Binary(I, flag)
if nargin < 2
    flag = 1;
end
bw1 = im2bw(I, graythresh(I));
if flag
    figure('units', 'normalized', 'position', [0 0 1 1]);
    subplot(2, 1, 1); imshow(I, []); title('������ͼ��', 'FontWeight', 'Bold');
    subplot(2, 1, 2); imshow(bw1, []); title('��ֵ��ͼ��', 'FontWeight', 'Bold');
end
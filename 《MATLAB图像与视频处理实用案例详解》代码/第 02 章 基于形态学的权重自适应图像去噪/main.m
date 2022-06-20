clc; clear all; close all;
filename = fullfile(pwd, 'images/im.jpg');
Img = imread(filename);
if ndims(Img) == 3
    I = rgb2gray(Img);
else
    I = Img;
end
Ig = imnoise(I,'poisson');
s = GetStrelList();
e = ErodeList(Ig, s);
f = GetRateList(Ig, e);
Igo = GetRemoveResult(f, e);
figure;
subplot(1, 2, 1); imshow(I, []); title('ԭͼ��');
subplot(1, 2, 2); imshow(Ig, []); title('����ͼ��');
figure;
subplot(2, 2, 1); imshow(e.eroded_co12, []); title('����1������');
subplot(2, 2, 2); imshow(e.eroded_co22, []); title('����2������');
subplot(2, 2, 3); imshow(e.eroded_co32, []); title('����3������');
subplot(2, 2, 4); imshow(e.eroded_co42, []); title('����4������');
figure;
subplot(1, 2, 1); imshow(Ig, []); title('����ͼ��');
subplot(1, 2, 2); imshow(Igo, []); title('����ȥ��ͼ��');
psnr1 = PSNR(I, e.eroded_co12);
psnr2 = PSNR(I, e.eroded_co22);
psnr3 = PSNR(I, e.eroded_co32);
psnr4 = PSNR(I, e.eroded_co42);
psnr5 = PSNR(I, Igo);
psnr_list = [psnr1 psnr2 psnr3 psnr4 psnr5];
figure; 
plot(1:5, psnr_list, 'r+-');
axis([0 6 18 24]);
set(gca, 'XTick', 0:6, 'XTickLabel', {'', '����1', '����2', '����3', ...
    '����4', '����', ''});
grid on;
title('PSNR���߱Ƚ�');



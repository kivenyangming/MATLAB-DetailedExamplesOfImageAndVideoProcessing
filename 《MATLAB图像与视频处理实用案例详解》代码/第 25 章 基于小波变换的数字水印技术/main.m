close  all
I = imread('office_5.jpg');
I = rgb2gray(I);
W = imread('logo.tif');
W=W(12:91,17:96);
figure('Name','����ͼ��')
imshow(I);
title('����ͼ��')
figure('Name','ˮӡͼ��')
imshow(W);
title('ˮӡͼ��')
ntimes=23;
rngseed=59433;
flag=1;
[Iw,psnr]=setdwtwatermark(I,W,ntimes,rngseed,0);
[Wg,nc]=getdwtwatermark(Iw,W,ntimes,rngseed,0);
close all
action={'filter','resize','crop','noise','rotate'};
for i=1:numel(action)
    dwtwatermarkattack(action{i},Iw,W,ntimes,rngseed);
end

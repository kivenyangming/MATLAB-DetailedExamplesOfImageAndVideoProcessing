clc; clear all; close all;
warning off all;
filename = '������ͼ��\\im1.bmp';
[I, map] = imread(filename);
I = ind2rgb(I, map);
I1 = Gray_Convert(I, 0);
bw1 = Image_Binary(I1, 0);
Hu = Compute_HuNicolas(bw1);
[resultNames, index] = CoMatrix_Process(filename, 1);
[fresultNames, index] = Hu_Process(filename, Hu, resultNames, index);
D = Analysis(filename, fresultNames, index, 1);
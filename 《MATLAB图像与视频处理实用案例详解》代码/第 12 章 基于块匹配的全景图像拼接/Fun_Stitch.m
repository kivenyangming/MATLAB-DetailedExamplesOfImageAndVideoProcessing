function [MStitch, im] = Fun_Stitch(im2, W_box, H_box, bdown, MStitch)
W_min = MStitch.W_min; 
W_max = MStitch.W_max;
H_min = MStitch.H_min;
minval = MStitch.minval;
im1 = MStitch.im1; 
[Fheight, Fwidth] = size(im2); 
im = im1; 
[Pheight, Pwidth] = size(im); 
w = 0; 
hw = waitbar(0, '图像拼接进度：', 'Name', '图像拼接……');
if bdown
    x2 = 1;
    for x1 = Pwidth-W_box : Pwidth
        y2 = 1;
        for y1 = Pheight-H_box+1 : Pheight
            [x1, y1] = CheckRC(x1, y1, im1);
            [x2, y2] = CheckRC(x2, y2, im2);
            w = x2/W_box; 
            im(y1, x1) = im1(y1, x1)*(1.0-w) + im2(y2, x2)*w;
            y2 = y2 + 1;
        end
        x2 = x2 + 1;
        rt = 0.5*(x1 - Pwidth + W_box)/W_box;
        waitbar(rt, hw, sprintf('图像拼接进度：%i%%', round(rt*100)));
    end
    rt0 = rt;
    for y1 = 1 : H_box
        for x3 = x2 : Fwidth
            [x1, y1] = CheckRC(x1, y1, im1);
            [x3, y1] = CheckRC(x3, y1, im2);
            im(y1, Pwidth+x3-x2+1) = im2(y1, x3);
        end
        rt = rt0 + 0.5*(y1 - 1)/H_box;
        waitbar(rt, hw, sprintf('图像拼接进度：%i%%', round(rt*100)));
    end
else
    x2 = 1;
    for x1 = Pwidth-W_box : Pwidth
        y2 = 1;
        for y1 = Fheight-H_box+1 : Fheight
            [x1, y1] = CheckRC(x1, y1, im1);
            [x2, y2] = CheckRC(x2, y2, im2);
            w = x2/W_box; 
            im(y1, x1) = im1(y1, x1)*(1.0-w) + im2(y2, x2)*w;
            y2 = y2 + 1;
        end
        x2 = x2 + 1;
        rt = 0.5*(x1 - Pwidth + W_box)/W_box;
        waitbar(rt, hw, sprintf('图像拼接进度：%i%%', round(rt*100)));
    end
    rt0 = rt;
    for y1 = Fheight-H_box+1 : Fheight
        for x3 = x2 : Fwidth
            [x1, y1] = CheckRC(x1, y1, im1);
            [x3, y1] = CheckRC(x3, y1, im2);
            im(y1, Pwidth+x3-x2+1) = im2(y1, x3);
        end
        rt = rt0 + 0.5*(y1 - 1)/H_box;
        waitbar(rt, hw, sprintf('图像拼接进度：%i%%', round(rt*100)));
    end
end
MStitch.im1 = im;
[Pheight, Pwidth] = size(im); 
MStitch.Pwidth = Pwidth;
MStitch.Pheight = Pheight; 
rt = 1;
waitbar(rt, hw, sprintf('图像拼接进度：%i%%', round(rt*100)));
delete(hw);
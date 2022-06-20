function dwtwatermarkattack(action,Iw,W,ntimes,rngseed)
switch lower(action)
    case 'filter'
        Ia=imfilter(Iw,ones(3)/9);
    case 'resize'
        Ia=imresize(Iw,0.5);
        Ia=imresize(Ia,2);
    case 'noise'
        Ia=imnoise(Iw,'salt & pepper',0.01);
    case 'crop'
        Ia=Iw;
        Ia(50:400,50:400)=randn();
    case 'rotate'
        Ia=imrotate(Iw,45,'nearest','crop');
        Ia=imrotate(Ia,-45,'nearest','crop');
end
[Wg,nc]=getdwtwatermark(Ia,W,ntimes,rngseed,0);
figure('Name',['����ˮӡ ',upper(action),' ��������'],'Position',[287,108,943,557]);
subplot(221)
imshow(Iw)
title('Ƕ��ˮӡͼ��')
subplot(222)
imshow(Ia)
title(['���� ',upper(action), ' ����'])
subplot(223)
imshow(W)
title('ԭʼˮӡͼ��')
subplot(224)
imshow(Wg)
title(['��ȡˮӡ��NC=',num2str(nc)]);
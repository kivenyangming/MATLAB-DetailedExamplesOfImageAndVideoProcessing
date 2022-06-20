function Hu = Compute_HuNicolas(in_image)
format long
if ndims(in_image) == 3
    image = rgb2gray(in_image);
else
    image = in_image;
end
image = double(image);
m00=sum(sum(image));
m10=0;
m01=0;
[row,col]=size(image);
for i=1:row
    for j=1:col
        m10=m10+i*image(i,j);
        m01=m01+j*image(i,j);
    end
end
u10=m10/m00;
u01=m01/m00;
n20 = 0;
n02 = 0;
n11 = 0;
n30 = 0;
n12 = 0;
n21 = 0;
n03 = 0;
for i=1:row
    for j=1:col
        n20=n20+i^2*image(i,j);
        n02=n02+j^2*image(i,j);
        n11=n11+i*j*image(i,j);
        n30=n30+i^3*image(i,j);
        n03=n03+j^3*image(i,j);
        n12=n12+i*j^2*image(i,j);
        n21=n21+i^2*j*image(i,j);
    end
end
n20=n20/m00^2;
n02=n02/m00^2;
n11=n11/m00^2;
n30=n30/m00^2.5;
n03=n03/m00^2.5;
n12=n12/m00^2.5;
n21=n21/m00^2.5;
h1 = n20 + n02;
h2 = (n20-n02)^2 + 4*(n11)^2;
h3 = (n30-3*n12)^2 + (3*n21-n03)^2;
h4 = (n30+n12)^2 + (n21+n03)^2;
h5 = (n30-3*n12)*(n30+n12)*((n30+n12)^2-3*(n21+n03)^2)+(3*n21-n03)*(n21+n03)*(3*(n30+n12)^2-(n21+n03)^2);
h6 = (n20-n02)*((n30+n12)^2-(n21+n03)^2)+4*n11*(n30+n12)*(n21+n03);
h7 = (3*n21-n03)*(n30+n12)*((n30+n12)^2-3*(n21+n03)^2)+(3*n12-n30)*(n21+n03)*(3*(n30+n12)^2-(n21+n03)^2);
Hu = [h1 h2 h3 h4 h5 h6 h7];
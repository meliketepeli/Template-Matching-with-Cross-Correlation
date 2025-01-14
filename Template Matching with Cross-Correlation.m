clc
clear all;

template=imread("image11.bmp");

search=imread("image1.bmp");

%performing normalized cross correlation and displaying as a surface
C=normxcorr2(template,search);
figure
surf(C)
shading flat

%finding peak points -eşleşen yerin konumu-
[xpeak, ypeak]=find(C==max( C(:) ));

%account for padding that normxcorr2 adds 
xoffset=xpeak-size(template,2);
yoffset=ypeak-size(template,1);

%display matched area by using the drawrectangle funct
figure
imshow(template);

figure
imshow(search);

drawrectangle(gca, 'Position',[xoffset, yoffset,size(template,2), size(template,1)],'FaceAlpha',0);
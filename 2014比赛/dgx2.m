z=imread('G:\cumcm2014problems\A\2.tif');
z=double(z);
x=1:1000;
y=1:1000;
contour(x,y,z,3)
shading flat
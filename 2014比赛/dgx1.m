z=imread('G:\cumcm2014problems\A\1.tif');
z=double(z);
x=1:2300;
y=1:2300;
contour(x,y,z,3)
shading flat
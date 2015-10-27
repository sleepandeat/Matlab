g=imread('G:\cumcm2014problems\A\1.tif');
gg=double(g);
[x,y]=size(gg);
[X,Y]=meshgrid(1:y,1:x);
mesh(X,Y,gg)
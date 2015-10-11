% By lyqmath
% DLUT School of Mathematical Sciences 2008
% BLOG£ºhttp://blog.sina.com.cn/lyqmath
clc; clear all; close all;
img = imread('C:\Users\ÕÅ•Fê»\Pictures\×ÀÃæ\psb.jpg');
imshow(img)
hold on
if ndims(img) == 3
    img1 = rgb2gray(img);
else
    img1 = img;
end
img1 = medfilt2(img1, [4, 4]);
bw = im2bw(img1, graythresh(img1));
bw = imclose(bw,strel('disk', 3));
bw = bwareaopen(bw, 500);
bw = imclearborder(bw);
bw = imclose(bw,strel('disk', 5));
L = bwlabel(bw);
stats = regionprops(L,'all');
imshow(bw);
hold on;
corn1 = stats(1).Extrema;
t1 = 2 : 2 : size(corn1, 1);
plot(corn1(t1, 1), corn1(t1, 2), 'r.', 'MarkerSize', 20);
corn2 = stats(2).Extrema;
t2 = 1 : 2 : size(corn2, 1);
plot(corn2(t2, 1), corn2(t2, 2), 'r.', 'MarkerSize', 20);
figure;
imshow(img); hold on;
plot(corn1(t1, 1), corn1(t1, 2), 'r.', 'MarkerSize', 20);
plot(corn2(t2, 1), corn2(t2, 2), 'r.', 'MarkerSize', 20);
plot(corn1(t1, 1), corn1(t1, 2), 'go', 'MarkerSize', 8);
plot(corn2(t2, 1), corn2(t2, 2), 'go', 'MarkerSize', 8);
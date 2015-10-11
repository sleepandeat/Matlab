mov=VideoReader('C:\Users\张旻昊\Desktop\数学建模比赛\Appendix4.avi'); %读入 
Vframes=size(mov,2); %读取视频的帧数，mov 为1*1179 struct，struct就是第4点所介绍的 for i=1: Vframes 
strtemp=strcat('C:\Users\张旻昊\Desktop\数学建模比赛\转换的图片\',int2str(i),'.','jpg'); %将每帧转成.jpg 的图片 imwrite(mov(i).cdata(:,:,), mov(i).colormap, strtemp); % 把图像写入磁盘 end 

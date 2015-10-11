vision=VideoReader('F:\sxjm\Appendix4.avi');
frame_num=vision.NumFrames;
frame_rate=vision.FramesPerSecond;
pic_kind='bmp';
i=1;
for n=1:frame_rate:frame_num
    mov=mmread(avi_file,n);
    pic_name=sprintf('%d',i);
    strtemp=strcat('F:\sxjm\','_',pic_name,'.',pic_kind);
    imwrite(mov.frames.cdata(:,:,:),strtemp);
    i=i+1;
end 

mov=VideoReader('C:\Users\�ŕF�\Desktop\��ѧ��ģ����\Appendix4.avi'); %���� 
Vframes=size(mov,2); %��ȡ��Ƶ��֡����mov Ϊ1*1179 struct��struct���ǵ�4�������ܵ� for i=1: Vframes 
strtemp=strcat('C:\Users\�ŕF�\Desktop\��ѧ��ģ����\ת����ͼƬ\',int2str(i),'.','jpg'); %��ÿ֡ת��.jpg ��ͼƬ imwrite(mov(i).cdata(:,:,), mov(i).colormap, strtemp); % ��ͼ��д����� end 

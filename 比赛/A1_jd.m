clear all
gl=3;                                                                       %控制杆长为3米
L=120;                                                                      %北京时间的标准精度
wd=39+54/60+26/3600;                                                        %控制当地纬度为39度54分26秒
jd=51:1:150;                                                                %中国的精度范围
n=5*31+3*30+28+22;                                                          %控制日期为10月22日
cwj=23.45*sin(360*(284+n)/365/180*pi);
B=360*(n-81)/364/180*pi;
e=9.87*sin(2*B)-7.53*cos(B)-1.5*sin(B);
Hs=9;                                                                       %控制时间为北京时间上午九点整
H=Hs+(jd-L)/15+e/60;
w=15*(H-12);
h=sin(wd/180*pi)*sin(cwj/180*pi)+cos(wd/180*pi)*cos(cwj/180*pi)*cos(w/180*pi);
y=gl*sqrt(1-h.^2)./h;
for k=1:size(y,2)
    if y(k)<0
        y(k)=0;
    end
end
plot(jd,y);
title('3米直杆太阳影子长度变化曲线')
xlabel('经度')
ylabel('影子长度 单位米')




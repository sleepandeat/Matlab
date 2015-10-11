clear all
gl=1.9628;
wd=39.7275;
L=120;
jd=80.7501;
n=202;
cwj=23.45*sin(360*(284+n)/365/180*pi);
B=360*(n-81)/364/180*pi;
e=9.87*sin(2*B)-7.53*cos(B)-1.5*sin(B);
Hs=(12+40/60):1/60:(13+41/60);   
H=Hs+(jd-L)/15+e/60;
w=15*(H-12);
h=sin(wd/180*pi)*sin(cwj/180*pi)+cos(wd/180*pi)*cos(w/180*pi).*cos(cwj/180*pi);
y=gl*sqrt(1-h.^2)./h;
Hs1=(12+41/60):3/60:(13+41/60);     
y1=[1.247256205	1.22279459	1.198921486	1.175428964	1.152439573	1.12991747...
    1.10783548	1.086254206	1.065081072	1.044446265	1.024264126	1.004640314...
    0.985490908	0.966790494	0.948584735	0.930927881	0.91375175	0.897109051...
    0.880973762	0.865492259	0.850504468];
plot(Hs,y,'r',Hs1,y1,'*');
title('附件2中直杆太阳影子长度变化曲线1')
xlabel('附件2中12：41-13：41 单位小时')
ylabel('直杆太阳影子长度 单位米')
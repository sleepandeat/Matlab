clear all
gl=5.6292;
wd=49.1885;
L=120;
jd=109.8295;
n=215;
cwj=23.45*sin(360*(284+n)/365/180*pi);
B=360*(n-81)/364/180*pi;
e=9.87*sin(2*B)-7.53*cos(B)-1.5*sin(B);
Hs=(13+1/60):1/60:(14+20/60);   
H=Hs+(jd-L)/15+e/60;
w=15*(H-12);
h=sin(wd/180*pi)*sin(cwj/180*pi)+cos(wd/180*pi)*cos(w/180*pi).*cos(cwj/180*pi);
y=gl*sqrt(1-h.^2)./h;
Hs1=(13+9/60):3/60:(14+9/60);     
y1=[3.533142184	3.546768029	3.561797643	3.578100715	3.595750783	3.61493428	3.635425983	3.657218272	3.680541115	3.705167836	3.731278025	3.758917911	3.788087888	3.818701015	3.850809619	3.88458522	3.919911828	3.956875992	3.99553479	4.035750835	4.077863059];
plot(Hs,y,'r',Hs1,y1,'*');
title('附件3中直杆太阳影子长度变化曲线2')
xlabel('附件3中13：09-14：09 单位小时')
ylabel('直杆太阳影子长度 单位米')






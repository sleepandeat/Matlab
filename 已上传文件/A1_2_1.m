clear all
gl=3;
phi=39+54/60+26/3600;
Ls=120;
L=116+23/60+29/3600;
n=1:1:365;
deta=23.45*sin(360*(284+n)/365/180*pi);
B=360*(n-81)/364/180*pi;
e=9.87*sin(2*B)-7.53*cos(B)-1.5*sin(B);
Hs=9;
H=Hs+(L-Ls)/15+e/60;
w=15*(H-12);
sinh=sin(phi/180*pi).*sin(deta/180*pi)+cos(phi/180*pi).*cos(w/180*pi).*cos(deta/180*pi);
y=gl*sqrt(1-sinh.^2)./sinh;
plot(n,y);
title('3米直杆太阳影子长度变化曲线')
xlabel('北京天安门广场9：00一年中的天数')
ylabel('3米直杆太阳影子长度 单位米')






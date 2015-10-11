clear all
gl=3;
phi=4:1:53;
Ls=120;
L=116+23/60+29/3600;
n=5*31+3*30+28+22;
deta=23.45*sin(360*(284+n)/365/180*pi);
B=360*(n-81)/364/180*pi;
e=9.87*sin(2*B)-7.53*cos(B)-1.5*sin(B);
Hs=9;
H=Hs+(L-Ls)/15+e/60;
w=15*(H-12);
sinh=sin(phi/180*pi)*sin(deta/180*pi)+cos(phi/180*pi)*cos(w/180*pi).*cos(deta/180*pi);
y=gl*sqrt(1-sinh.^2)./sinh;
plot(phi,y);
title('3��ֱ��̫��Ӱ�ӳ��ȱ仯����')
xlabel('10��22��9��00��ͬγ��')
ylabel('3��ֱ��̫��Ӱ�ӳ��� ��λ��')






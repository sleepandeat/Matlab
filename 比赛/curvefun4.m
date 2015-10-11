function f=curvefun4(x,y);
% x(1)=¾­¶È;x(2)=Î³¶È,x(3)=a
L=120;
Hs=(8+54/60):1/60:(9+34/60);
n=3*31+2*30+28+13;
cwj=23.45*sin(360*(284+n)/365/180*pi);
B=360*(n-81)/364/180*pi;
e=9.87*sin(2*B)-7.53*cos(B)-1.5*sin(B);   
H=Hs+(x(1)-L)/15+e/60;
w=15*(H-12);
sinh=sin(x(2)/180*pi)*sin(cwj/180*pi)+cos(x(2)/180*pi)*cos(w/180*pi).*cos(cwj/180*pi);
cosh=sqrt(1-sinh.^2);
yc=2*cosh./sinh;
cosAs=(sinh*sin(x(2)/180*pi)-sin(cwj/180*pi))/(cosh*cos(x(2)/180*pi));
sinAs=sqrt(1-cosAs.^2);
f=yc.*abs(sin(x(3)/180*pi).*cosAs+cos(x(3)/180*pi).*sinAs);
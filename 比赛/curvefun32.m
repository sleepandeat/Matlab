function f=curvefun32(x,y)
global n;
L=120;
cwj=23.45*sin(360*(284+n)/365/180*pi);
B=360*(n-81)/364/180*pi;
e=9.87*sin(2*B)-7.53*cos(B)-1.5*sin(B);
Hs=(13+9/60):3/60:(14+9/60);   
H=Hs+(x(1)-L)/15+e/60;
w=15*(H-12);
h=sin(x(2)/180*pi)*sin(cwj/180*pi)+cos(x(2)/180*pi)*cos(w/180*pi).*cos(cwj/180*pi);
f=x(3)*sqrt(1-h.^2)./h;
% x(1)=经度; x(2)=纬度,x(3)=杆高; 
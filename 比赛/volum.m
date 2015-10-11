function f=volum(x,y)
jd=120;
n=2*31+28+18;
cwj=23.45*sin(360*(284+n)/365/180*pi);
B=360*(n-81)/364/180*pi;
e=9.87*sin(2*B)-7.53*cos(B)-1.5*sin(B);
Hs=(14+42/60):3/60:(15+42/60);   
H=Hs+(x(1)-jd)/15+e/60;
w=15*(H-12);
%h=sin(x(2)/180*pi)*sin(cwj/180*pi)+cos(x(2)/180*pi)*cos(cwj/180*pi)*cos(w/180*pi);
f=x(3)*sqrt(1-(sin(x(2)/180*pi)*sin(cwj/180*pi)+cos(x(2)/180*pi)*cos(cwj/180*pi)*...
cos(w/180*pi)).^2)./(sin(x(2)/180*pi)*sin(cwj/180*pi)+cos(x(2)/180*pi)*cos(cwj/180*pi)*cos(w/180*pi));
% x(1)=经度; x(2)=纬度,x(3)=杆高;
  
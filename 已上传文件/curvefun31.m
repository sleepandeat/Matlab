function f=curvefun31(x,y)
global n;
Ls=120;
deta=23.45*sin(360*(284+n)/365/180*pi);
B=360*(n-81)/364/180*pi;
e=9.87*sin(2*B)-7.53*cos(B)-1.5*sin(B);
Hs=(12+41/60):3/60:(13+41/60);   
H=Hs+(x(1)-Ls)/15+e/60;
    w=15*(H-12);
    sinh=sin(x(2)/180*pi)*sin(deta/180*pi)+cos(x(2)/180*pi)*cos(w/180*pi).*cos(deta/180*pi);
    f=x(3)*sqrt(1-sinh.^2)./sinh;
                   % x(1)=经度; x(2)=纬度,x(3)=杆高;
  
function f=curvefun1(x,y)
 Ls=120;
n=2*31+28+18;
deta=23.45*sin(360*(284+n)/365/180*pi);
B=360*(n-81)/364/180*pi;
e=9.87*sin(2*B)-7.53*cos(B)-1.5*sin(B);
Hs=(14+42/60):3/60:(15+42/60);   
H=Hs+(x(1)-Ls)/15+e/60;
    w=15*(H-12);
    sinh=sin(x(2)/180*pi)*sin(deta/180*pi)+cos(x(2)/180*pi)*cos(w/180*pi).*cos(deta/180*pi);
    f=x(3)*sqrt(1-sinh.^2)./sinh;
                   % x(1)=����; x(2)=γ��,x(3)=�˸�;
  
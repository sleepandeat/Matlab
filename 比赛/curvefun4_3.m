function f=curvefun4_3(x,y)
global n;
Ls=120;
deta=23.45*sin(360*(284+n)/365/180*pi);
B=360*(n-81)/364/180*pi;
e=9.87*sin(2*B)-7.53*cos(B)-1.5*sin(B);
Hs=(8+54/60+6/3600):3/60:(9+32/60+6/3600);   
H=Hs+(x(1)-Ls)/15+e/60;
    w=15*(H-12);
    sinh=sin(x(2)/180*pi)*sin(deta/180*pi)+cos(x(2)/180*pi)*cos(w/180*pi).*cos(deta/180*pi);
    f1=2*sqrt(1-sinh.^2)./sinh;%f1=杆子影子长度
    cosAs=(sinh*sin(x(2)/180*pi)-sin(deta/180*pi))./sqrt(1-sinh.^2)/cos(x(2)/180*pi);
    sinAs=sqrt(1-cosAs.^2);
    f2=cos(x(6)/180*pi)*cosAs-sin(x(6)/180*pi)*sinAs;
    f3=sqrt(1-f2.^2);
    f4=((x(3)+f1.*f3)./(x(5)+f1.*f2)*0.0010905*x(5)-x(3)/x(5)*0.0010905*x(5)).^2+(x(4)*0.0010905*x(5)./(x(5)+f1.*f2)-x(4)/x(5)*0.0010905*x(5)).^2;
    f=sqrt(f4)*10^3;%cos上成像单位为毫米
  % x(1)=经度, x(2)=纬度；
  % （x（3）、x（4）、x（5））=杆子底点的坐标，x(6)=光轴与地面上正南方向的夹角；
  
                   ;
  
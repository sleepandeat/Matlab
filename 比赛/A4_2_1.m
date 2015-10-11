clear all
x=[ 114.1970   54.4271    2.9343   -0.6790   21.1142    7.8482];
wd=x(2);
L=120;
jd=x(1);
n=3*31+28+2*30+13;
cwj=23.45*sin(360*(284+n)/365/180*pi);
B=360*(n-81)/364/180*pi;
e=9.87*sin(2*B)-7.53*cos(B)-1.5*sin(B);
Hs=(8+50/60):1/60:(9+35/60);
H=Hs+(jd-L)/15+e/60;
w=15*(H-12);
sinh=sin(wd/180*pi)*sin(cwj/180*pi)+cos(wd/180*pi)*cos(w/180*pi).*cos(cwj/180*pi);
f1=2*sqrt(1-sinh.^2)./sinh;%f1=杆子影子长度
cosAs=(sinh*sin(x(2)/180*pi)-sin(cwj/180*pi))./sqrt(1-sinh.^2)/cos(x(2)/180*pi);
sinAs=sqrt(1-cosAs.^2);
f2=cos(x(6)/180*pi)*cosAs-sin(x(6)/180*pi)*sinAs;
f3=sqrt(1-f2.^2);
f4=((x(3)+f1.*f3)./(x(5)+f1.*f2)*0.0010905*x(5)-x(3)/x(5)*0.0010905*x(5)).^2+(x(4)*0.0010905*x(5)./(x(5)+f1.*f2)-x(4)/x(5)*0.0010905*x(5)).^2;
f=sqrt(f4)*10^3;%cos上成像单位为毫米

Hs1=(8+54/60+6/3600):3/60:(9+32/60+6/3600); 
Hs2=[8.985	9.018333333	9.035	9.068333333	9.085	9.118333333	9.135	9.168333333	9.185	9.218333333	9.235	9.268333333	9.285	9.318333333	9.335	9.368333333	9.385	9.418333333	9.435	9.468333333	9.485	9.518333333	9.535	9.551666667];
q2=[2.50031879	2.474326143	2.473442676	2.422050254	2.410349808	2.383967143	2.358272447	2.332375001	2.306974413	2.29450534	2.280464538	2.243243104	2.229991974	2.13543274	2.172352134	2.139616518	2.12699249	2.098804492	2.075589858	2.049912315	2.049642881	2.023964977	1.998210841	1.998326752];
q0=[0.002596133	0.002577275	0.002551067	0.002525092	0.002524329	0.002500319	0.002499761	0.002474326	0.002473443	0.002422379	0.00242205	0.00241035	0.002404393	0.002383967	0.002358272	0.002344471	0.002332375	0.002306974	0.002305722	0.002294505	0.002280465	0.002255311	0.002243243	0.002229992	0.002216285	0.002135433	0.002172352	0.002153208	0.002139617	0.002126992	0.0021198	0.002098804	0.00207559	0.002051837	0.002049912	0.002049643	0.002024388	0.002023965	0.001998211	0.001998327];
q=q0(1:3:39)*10^3;%cos上成像单位为毫米
plot(Hs,f,'r',Hs1,q,'*',Hs2,q2,'+');
title('第四小题第一问第一组解的检验图')
xlabel('附件四中8：54:06-9:32:06 *为拟合数据 +为检验数据')
ylabel('直杆太阳影子在cmos上成像长度 单位毫米')






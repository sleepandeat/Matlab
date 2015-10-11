clear all
gl=3;                                                                       %杆长为3米
L=120;                                                                      %北京时间的经度
wd=39+54/60+26/3600;                                                        %当地纬度
jd=116+23/60+29/3600;                                                       %当地经度
n=5*31+3*30+28+22;                                                          %10月22日在2015年中的天数序号
cwj=23.45*sin(360*(284+n)/365/180*pi);
B=360*(n-81)/364/180*pi;
e=9.87*sin(2*B)-7.53*cos(B)-1.5*sin(B);
Hs=9:1/60:15;                                                               %时间段内每一分钟
H=Hs+(jd-L)/15+e/60;
w=15*(H-12);
h=sin(wd/180*pi)*sin(cwj/180*pi)+cos(wd/180*pi)*cos(cwj/180*pi)*cos(w/180*pi);
y=gl*sqrt(1-h.^2)./h;
bs=0.76;
T=20;
P=101080;
f=exp(12.062-4039.558/(T+235.379));
Ns=(8342.54+2406147/(130-(1/bs)^2)+15998/(38.9-(1/bs)^2))/(10^8);
Ntp=P*Ns/96095.43*(1+(10^-8)*(0.601-0.00972*T)*P)/(1+0.00361*T);
Ntpf=Ntp-f*(3.7345-0.0401*(1/bs)^2)*10^-10;
a=1+Ntpf;
h=cos(asin(sqrt(1-h.^2)/a));
y1=gl*sqrt(1-h.^2)./h;
plot(Hs,y1,'r',Hs,y,'-');
legend('计算大气影响下3米直杆太阳影子长度变化曲线','未计算大气影响下3米直杆太阳影子长度变化曲线')
xlabel('时间 单位h')
ylabel('影子长度 单位米')
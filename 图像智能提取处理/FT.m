Dt=0.00005; 
t=-0.005:Dt:0.005; 
xa=exp(-1000*abs(t)); %模拟信号 
Wmax=2*pi*2000; %Dt=0.00005 so 周期为2*pi*2000
K=500;k=0:1:K; 
W=k*Wmax/K; %将Wmax分为等间隔的500点,W是离散化后的旋转因子
Xa=xa*exp(-j*t'*W)*Dt; 
Xa=real(Xa); %Xa=real(Xa)其实是取Xa各元素的模（幅值）
%连续时间傅立叶变换 
W=[-fliplr(W),W(2:501)];
%频率从 -Wmax to Wmax 
Xa=[fliplr(Xa), Xa(2:501)];
% Xa 范围 -Wmax to Wmax
figure(1)
subplot(2,1,1);
plot(t*1000,xa,'.');
xlabel('t in msec');
ylabel('xa(t)');
gtext('模拟信号');
subplot(2,1,2);
plot(W/(2*pi*1000),Xa*1000,'.');
xlabel('Frequence in KHz');
ylabel('Xa(jw)*1000');
gtext('连续时间傅里叶变换');

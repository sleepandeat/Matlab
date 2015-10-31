Dt=0.00005; 
t=-0.005:Dt:0.005; 
xa=exp(-1000*abs(t)); %ģ���ź� 
Wmax=2*pi*2000; %Dt=0.00005 so ����Ϊ2*pi*2000
K=500;k=0:1:K; 
W=k*Wmax/K; %��Wmax��Ϊ�ȼ����500��,W����ɢ�������ת����
Xa=xa*exp(-j*t'*W)*Dt; 
Xa=real(Xa); %Xa=real(Xa)��ʵ��ȡXa��Ԫ�ص�ģ����ֵ��
%����ʱ�丵��Ҷ�任 
W=[-fliplr(W),W(2:501)];
%Ƶ�ʴ� -Wmax to Wmax 
Xa=[fliplr(Xa), Xa(2:501)];
% Xa ��Χ -Wmax to Wmax
figure(1)
subplot(2,1,1);
plot(t*1000,xa,'.');
xlabel('t in msec');
ylabel('xa(t)');
gtext('ģ���ź�');
subplot(2,1,2);
plot(W/(2*pi*1000),Xa*1000,'.');
xlabel('Frequence in KHz');
ylabel('Xa(jw)*1000');
gtext('����ʱ�丵��Ҷ�任');

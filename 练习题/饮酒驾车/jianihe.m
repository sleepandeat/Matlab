clear,clc
shuju
figure(1),plot(t,c,'*')
S=zeros(100,1);
S(1)=inf;
S(2)=inf;
n=3;
while S(n-1)<=S(n-2)&&n<100
    
    P=polyfit(t,c,n);       %���
    C=polyval(P,t);         %������Ϻ���
    S(n)=sum((C-c).^2);     %����
    n=n+1;
end
n=n-2
r=S(n)
figure(2),plot(t,c,'*',t,polyval(polyfit(t,c,n),t))

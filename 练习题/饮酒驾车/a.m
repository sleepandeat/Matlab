shuju
figure(1),plot(t,c,'*')
n=1;
while n<22
    P=polyfit(t,c,n);
    C=polyval(P,t);
    S=sum((C-c).^2);
    n=n+1;
end
figure(2),plot(t,c,'*',t,C)
n=n-1
S
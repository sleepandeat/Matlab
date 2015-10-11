clc
clear all
close all

figure(1);
hold on;
lb=1;ub=2;
ezplot('sin(10*pi*X)/X',[lb,ub]);
xlabel('�Ա���/X');
ylabel('�Ա���?y');

NIND=40;
MAXGEN=20;
PRECI=20;
GGAP=0.95;
px=0.7;
pm=0.01;
trace=zeros(2,MAXGEN);
FieldD=[PRECI;lb;ub;1;0;1;1];
Chrom=crtbp(NIND,PRECI);

gen=0;
X=bs2rv(Chrom,FieldD);
ObjV=sin(10*pi*X)./X;
while gen<MAXGEN
    FitnV=ranking(ObjV);
    SelCh=select('sus',Chrom,FitnV,GGAP);
    SelCh=recombin('xovsp',SelCh,px);
    Selch=mut(SelCh,pm);
    X=bs2rv(SelCh,FieldD);
    ObjVSel=sin(10*pi*X)./X;
    [Chrom,ObjV]=reins(Chrom,SelCh,1,1,ObjV,ObjVSel);
    X=bs2rv(Chrom,FieldD);
    gen=gen+1;
    [Y,I]=min(ObjV);
    trace(1,gen)=X(I);
    trace(2,gen)=Y;
end
plot(trace(1,:),trace(2,:),'bo');
grid on;
plot(X,ObjV,'b*');
hold off;

figure(2);
plot(1:MAXGEN,trace(2,:));
grid on;
xlabel('�Ŵ�����')
ylabel('��ı仯')
title('��������')
bestY=trace(2,end);
bestX=trace(1,end);
fprintf(['���Ž⣺\nX',num2str(bestX),'\nY',num2str(bestY),'\n'])
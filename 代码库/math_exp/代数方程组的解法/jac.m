%Jacobian��������
function [x,sp]=jac(a,b,n,x1)
%���
e=ones(n,1);
%�����Ľ�����
x2=zeros(n,1);
%�����Ĵ���
k=0;
%�����û������Ҫ��ʱ��������
while norm(e,2)>1e-6
   %ÿ��5����ʾ�������
   if (rem(k,5)==0)
      str=sprintf('X%d= %g %g %g %g\n',k,x1);
      disp(str)
   end
   k=k+1;
   %����x2��i��
   for i=1:n
      s=0;
      for j=1:n
         s=s+a(i,j)*x1(j);
      end
      x2(i)=(b(i)-s)/a(i,i)+x1(i);
   end
   %�����������
   e=x2-x1;
   %��x2��Ϊ�µĵ�����ֵ
   x1=x2;
end
%���ص�������
sp=k;
%���ص���ֵ
x=x2;
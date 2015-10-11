%Successive Over Relaxation��������
function [x,sp]=sor(a,b,n,x1,w)
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
      s1=0;
      s2=0;
      if i-1>0
         for j=1:i-1
            s1=s1+a(i,j)*x2(j);
         end
      end
      for j=i:n
         s2=s2+a(i,j)*x1(j);
      end
      x2(i)=x1(i)+w*(b(i)-s1-s2)/a(i,i);
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
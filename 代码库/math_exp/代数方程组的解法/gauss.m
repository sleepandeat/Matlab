%˳��gauss��ȥ����gauss����
function [A,u]=gauss(a,n)
for k=1:n-1
   %��ȥ����
   for i=k+1:n
      for  j=k+1:n+1
         %���a(k,k)=0,������ȥ
         if abs(a(k,k))>1e-6
            %�����k�����������
            a(i,j)=a(i,j)-a(i,k)/a(k,k)*a(k,j);
         else
            %a(k,k)=0,˳��gauss��ȥʧ��
            disp('˳��gauss��ȥʧ��');
            pause;
            exit;
         end
      end
   end
end
%�ش�����
x(n)=a(n,n+1)/a(n,n);
for i=n-1:-1:1
   s=0;
   for j=i+1:n
      s=s+a(i,j)*x(j);
   end
   x(i)=(a(i,n+1)-s)/a(i,i);
end
%����gauss��ȥ����������
A=triu(a);
%���ط�����Ľ�
u=x;
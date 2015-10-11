%����Ԫgauss��ȥ����
function [A,u]=gauss(a,n)
%��ȥ����
for k=1:n-1
   %ѡ��Ԫ
   c=0;
   for q=k:n
      if abs(a(q,k))>c
         c=a(q,k);
         l=q;
      end
   end
   %�����ԪΪ0�������A������
   if abs(c)<1e-10
      disp('error');
      pause;
      exit;
   end
   %���l������k���򽻻���l�к͵�k��
   if l~=k 
      for q=k:n+1
         temp=a(k,q);
         a(k,q)=a(l,q);
         a(l,q)=temp;
      end
   end
   %�����k����Ԫ��ֵ
   for i=k+1:n
      for  j=k+1:n+1
         a(i,j)=a(i,j)-a(i,k)/a(k,k)*a(k,j);
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
%��������Ԫgauss��ȥ����������
A=triu(a);
%���ط�����Ľ�
u=x;
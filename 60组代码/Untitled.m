close all;
clear all;
a=0;b=2;c=0;d=1;
n=6;m=5;TOL=1e-10;
ITMAX=100;
f=inline('x*exp(y)','x','y');
ga=inline('0','x','y');gb=inline('2*exp(y)','x','y');
gc=inline('x','x','y');gd=inline('exp(1)*x','x','y');
h=(b-a)/n;
k=(d-c)/m;
x=linspace(a,b,n+1);
x=x(2:n);
y=linspace(c,d,m+1);
y=y(2:m);
u=zeros(n-1,m-1);
lmd=h^2/k^2;
mu=2*(1+lmd);
%l=1;
%while (l<=ITMAX)
for k=1:61
    z=(-h*h*f(x(1),y(m-1))+ga(a,y(m-1))+lmd*gd(x(1),d)+...
	  lmd*u(1,m-2)+u(2,m-1))/mu;
    u(1,m-1)=z;
    for i=2:n-2
         z=(-h*h*f(x(i),y(m-1))+lmd*gd(x(i),d)+u(i-1,m-1)+...
	       u(i+1,m-1)+lmd*u(i,m-2))/mu;
         u(i,m-1)=z;
    end
      z=(-h*h*f(x(n-1),y(m-1))+gb(b,y(m-1))+...
	  lmd*gd(x(n-1),d)+u(n-2,m-1)+lmd*u(n-1,m-2))/mu;
	  u(n-1,m-1)=z;
	   for j=m-2:-1:2
	    z=(-h*h*f(x(1),y(i))+ga(a,y(j))+lmd*u(1,j+1)+...
	       lmd*u(1,j-1)+u(2,j))/mu;
	    u(1,j)=z;
	    for i=2:n-2
	        z=(-h*h*f(x(i),y(j))+u(i-1,j)+lmd*u(i,j+1)+...
		    u(i+1,j)+lmd*u(i,j-1))/mu;
		    u(i,j)=z;
       end
          
	  z=(-h*h*f(x(n-1),y(j))+gb(b,y(j))+u(n-2,j)+...
	    lmd*u(n-1,j+1)+lmd*u(n-1,j-1))/mu;
	    u(n-1,j)=z; 
    end
	    z=(-h*h*f(x(1),y(1))+ga(a,y(1))+lmd*gc(x(1),c)+...
	       lmd*u(1,2)+u(2,1))/mu;
	    u(1,1)=z;
	   for i=2:n-2
	     z=(-h*h*f(x(i),y(1))+lmd*gc(x(i),c)+...
		   u(i-1,1)+lmd*u(i,2)+u(i+1,1))/mu;
		   u(i,1)=z;
       end
	       z=(-h*h*f(x(n-1),y(1))+gb(b,y(1))+lmd*gc(x(n-1),c)+...
		      u(n-2,1)+lmd*u(n-1,2))/mu;
		   u(n-1,1)=z;
         %if(NORM<=TOL)
       x'
       y'
       u'
         %l=l+1;
         %end
     end
%error('����ITMAX�ķ�Χ');
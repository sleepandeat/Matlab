A=double(A);
m=size(A,1);
n=size(A,2);
B=zeros(m,n);
D=zeros(m,n);
for i=1:m
    for j=1:n
        if i==1|j==1|i==m|j==n
            B(i,j)=0;
        else
            B(i,j)=1/4*(abs(A(i-1,j)-A(i,j))+abs(A(i+1,j)-A(i,j))+abs(A(i,j-1)-A(i,j))+abs(A(i,j+1)-A(i,j)));
            D(i,j)=1/4*((B(i,j)-A(i-1,j))^2+(B(i,j)-A(i+1,j))^2+(B(i,j)-A(i,j-1))^2+(B(i,j)-A(i,j+1))^2);
        end           
    end
end

m1=m/100;
n1=n/100;

C=ones(m1,n1);
for i=1:m1
for j=1:n1
s=0;
for p=1:100
for q=1:100
s=s+D((i-1)*100+p,(j-1)*100+q);
end
end
s=s/10000;
C(i,j)=s;
C;
end
end
a=[0 1 -1 1 0 0 0 0 0 0;0 0 0 1 1 0 0 0 0 0;0 0 0 0 0 -1 1 0 0 0;
   1 1 0 0 0 0 0 0 0 0;1 0 0 0 1 0 0 0 0 0;0 0 0 0 0 0 1 1 0 0;
   0 0 0 0 0 0 0 0 1 0;0 0 0 0 0 0 0 0 -1 1;0 0 0 0 0 0 0 0 0 1;
   0 0 1 0 0 1 0 1 0 0];
b=[300 500 200 800 800 1000 400 200 600 1000]';
r=[a,b]
rank(a)
rank(r)
B=rref(r)

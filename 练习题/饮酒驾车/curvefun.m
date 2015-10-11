function f=curvefun(x,t)
f=103.333*x(1)*(exp(-x(2)*t)-exp(-x(1)*t))/(x(1)-x(2)); 
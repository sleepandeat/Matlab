function y=cosa(x0,y0,z0,b)
y=(-2*x0^2+2*y0*(b-y0)+60*(z0-15))/sqrt((x0^2+(b-y0)^2+(15-z0)^2)*(4*x0^2+4*y0^2+3600));

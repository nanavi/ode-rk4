f = @(t,x,y,z) 2*y+3*x;
g = @(t,x,y,z) 3*y-2*x;
t0 = 0;
x0 = 2;
y0 = 0;
N = 0:0.1:2;
RK4Sistemas2(f,g,t0,x0,y0,N);
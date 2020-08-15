f = @(t,x,y,z) x-4*y;
g = @(t,x,y,z) x+y-2;
t0 = 0;
x0 = 2;
y0 = 1;
N = 0:0.2:2;
RK4Sistemas2(f,g,t0,x0,y0,N);
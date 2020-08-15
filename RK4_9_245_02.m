f = @(t,x,y,z) x+y;
g = @(t,x,y,z) x-y-1;
t0 = 0;
x0 = 0;
y0 = 2;
N = 0:0.2:2;
RK4Sistemas2(f,g,t0,x0,y0,N);
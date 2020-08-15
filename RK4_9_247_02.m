f = @(t,x,y,z) y;
g = @(t,x,y,z) 5-x-y;
t0 = 0;
x0 = 0;
y0 = 1;
N = 0:0.2:2;
RK4Sistemas2(f,g,t0,x0,y0,N);
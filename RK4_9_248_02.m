g = @(t,x,y,z) z;
f = @(t,x,y,z) y;
z = @(t,x,y,z) 1 + exp(2*t)-x-3*y-3*z;
t0 = 0;
x0 = 0;
y0 = 0;
z0 = 0;
N = 0:0.2:2;
RK4Sistemas3(f,g,z,t0,x0,y0,z0,N);
%Para resolver x'=f(t,x,y), x(t0)=x0
%y'=f(t,x,y), y(t0)=y0
%tt=[t0 t1 ... tn]
function [x y z] = RK4Sistemas3(f,g,q,t0,x0,y0,z0,tt)
  n=length(tt);
  x(1)=x0; y(1)=y0; z(1)=z0;
  for i=1:n-1
    h=tt(i+1)-tt(i);
    K1=h*f(tt(i),x(i),y(i),z(i));
    L1=h*g(tt(i),x(i),y(i),z(i));
    M1=h*q(tt(i),x(i),y(i),z(i));
    K2=h*f(tt(i)+h/2,x(i)+K1/2,y(i)+L1/2,z(i)+M1/2);
    L2=h*g(tt(i)+h/2,x(i)+K1/2,y(i)+L1/2,z(i)+M1/2);
    M2=h*q(tt(i)+h/2,x(i)+K1/2,y(i)+L1/2,z(i)+M1/2);
    K3=h*f(tt(i)+h/2,x(i)+K2/2,y(i)+L2/2,z(i)+M2/2);
    L3=h*g(tt(i)+h/2,x(i)+K2/2,y(i)+L2/2,z(i)+M2/2);
    M3=h*q(tt(i)+h/2,x(i)+K2/2,y(i)+L2/2,z(i)+M2/2);
    K4=h*f(tt(i)+h,x(i)+K3,y(i)+L3,z(i)+M3);
    L4=h*g(tt(i)+h,x(i)+K3,y(i)+L3,z(i)+M3);
    M4=h*q(tt(i)+h,x(i)+K3,y(i)+L3,z(i)+M3);
    x(i+1)=x(i)+(K1+2*K2+2*K3+K4)/6;
    y(i+1)=y(i)+(L1+2*L2+2*L3+L4)/6;
    z(i+1)=z(i)+(M1+2*M2+2*M3+M4)/6;
  end
  %%%Gráficas
  for i=1:n
    hold on
    plot(tt(i),x(i),'*r')
  endfor
  %  t=tt(1):0.05:tt(n);
  % x1 = (1/27).*(-2.*(exp(-t)).*(9.*(t.^2)+15.*t+14)+exp(2.*t)+27);
  % hold on
  % plot(t,x1,'g')
  % grid on
endfunction
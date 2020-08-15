%Para resolver x'=f(t,x,y), x(t0)=x0
%y'=f(t,x,y), y(t0)=y0
%tt=[t0 t1 ... tn]
function [x y]=RK4Sistemas2(f,g,t0,x0,y0,tt)
  n=length(tt);
  x(1)=x0; y(1)=y0;
  for i=1:n-1
    h=tt(i+1)-tt(i);
    K1=h*f(tt(i),x(i),y(i));
    L1=h*g(tt(i),x(i),y(i));
    K2=h*f(tt(i)+h/2,x(i)+K1/2,y(i)+L1/2);
    L2=h*g(tt(i)+h/2,x(i)+K1/2,y(i)+L1/2);
    K3=h*f(tt(i)+h/2,x(i)+K2/2,y(i)+L2/2);
    L3=h*g(tt(i)+h/2,x(i)+K2/2,y(i)+L2/2);
    K4=h*f(tt(i)+h,x(i)+K3,y(i)+L3);
    L4=h*g(tt(i)+h,x(i)+K3,y(i)+L3);
    x(i+1)=x(i)+(K1+2*K2+2*K3+K4)/6;
    y(i+1)=y(i)+(L1+2*L2+2*L3+L4)/6;
  end
  %%%Gráficas
  for i=1:n
    hold on
    plot(tt(i),x(i),'*r')
    hold on
    plot(tt(i),y(i),'*b')
  endfor
  hold on
  grid on
endfunction
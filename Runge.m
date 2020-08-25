function [] = Runge()

S.fh = figure('units','pixels',
              'position',[800 800 800 800],
              'menubar','none',
              'name','Runge Kutta',
              'numbertitle','off',
              'resize','off');

COL = get(S.fh,'color');          
S.ax = axes ("position", [0.1 0.4 0.5 0.5]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
S.ed(1) = uicontrol('style','edit',
                    'units','pix',
                    'position',[5 230 170 30],
                    'string','3');

S.tx(1) = uicontrol('style','text',
                    'units','pix',
                    'position',[20 260 100 30],
                    'string','Ecuacion',
                    'fontsize',11,
                    'backgroundcolor',COL);
% System of differential equations
% 1st Equation
S.ed(8) = uicontrol('style','edit',
                   'units','pix',
                    'position',[5 170 170 30],
                    'string','y-4*z');

S.tx(8) = uicontrol('style','text',
                    'units','pix',
                    'position',[20 200 200 30],
                    'string','Sistemas de ecuaciones',
                    'fontsize',11,
                    'backgroundcolor',COL);
% 2nd Equation
S.ed(9) = uicontrol('style','edit',
                   'units','pix',
                    'position',[5 140 170 30],
                    'string','y+z-2');
% Text step h:
S.tx(9) = uicontrol('style','text',
                    'units','pix',
                    'position',[220 200 30 30],
                    'string','h',
                    'fontsize',11,
                    'backgroundcolor',COL);

S.ed(10) = uicontrol('style','edit',
                    'units','pix',
                    'position',[210 170 40 30],
                    'string','0.1');  
% steps quantity:
S.tx(10) = uicontrol('style','text',
                    'units','pix',
                    'position',[250 200 140 30],
                    'string','cantidad de pasos',
                    'fontsize',11,
                    'backgroundcolor',COL);
S.ed(11) = uicontrol('style','edit',
                    'units','pix',
                    'position',[300 170 40 30],
                    'string','20');  
% initial conditions:
S.tx(11) = uicontrol('style','text',
                    'units','pix',
                    'position',[400 200 160 30],
                    'string','condiciones iniciales',
                    'fontsize',11,
                    'backgroundcolor',COL);
% input field 
S.ed(12) = uicontrol('style','edit',
                   'units','pix',
                    'position',[400 170 170 30],
                    'string','2');
% input field 
S.ed(13) = uicontrol('style','edit',
                   'units','pix',
                    'position',[400 140 170 30],
                    'string','1');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                  
S.ed(2) = uicontrol('style','edit',
                    'units','pix',
                    'position',[180 230 40 30],
                    'string','0');  
S.tx(2) = uicontrol('style','text',
                    'units','pix',
                    'position',[190 260 20 30],
                    'string','Xo',
                    'fontsize',11,
                    'backgroundcolor',COL);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
S.ed(3) = uicontrol('style','edit',
                    'units','pix',
                    'position',[230 230 40 30],
                    'string','1');  
S.tx(3) = uicontrol('style','text',
                    'units','pix',
                    'position',[240 260 20 30],
                    'string','Xf',
                    'fontsize',11,
                    'backgroundcolor',COL);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
S.ed(4) = uicontrol('style','edit',
                    'units','pix',
                    'position',[280 230 40 30],
                    'string','0');  
S.tx(4) = uicontrol('style','text',
                    'units','pix',
                    'position',[290 260 20 30],
                    'string','Y',
                    'fontsize',11,
                    'backgroundcolor',COL);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
S.ed(5) = uicontrol('style','edit',
                    'units','pix',
                    'position',[330 230 40 30],
                    'string','0.2');  
S.tx(5) = uicontrol('style','text',
                    'units','pix',
                    'position',[340 260 20 30],
                    'string','h',
                    'fontsize',11,
                    'backgroundcolor',COL);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%       
S.ed(6) = uicontrol('style','edit',
                    'units','pix',
                    'position',[380 230 190 30],
                    'string','Respuesta');
S.lsX = uicontrol('style','listbox',
                 'units','pix',
                 'position',[600 200 70 250],
                 'backgroundcolor','w');
S.lsY = uicontrol('style','listbox',
                 'units','pix',
                 'position',[700 200 70 250],
                 'backgroundcolor','w');
S.tx(6) = uicontrol('style','text',
                    'units','pix',
                    'position',[600 455 20 30],
                    'string','X',
                    'fontsize',11,
                    'backgroundcolor',COL);
S.tx(7) = uicontrol('style','text',
                    'units','pix',
                    'position',[700 455 20 30],
                    'string','Y',
                    'fontsize',11,
                    'backgroundcolor',COL);
S.pb = uicontrol('style','push',
                  'units','pix',
                  'position',[160 20 120 30],
                  'string','Calcular Ecuacion',
                  'callback',{@rk4,S});

S.pb = uicontrol('style','push',
                  'units','pix',
                  'position',[310 20 120 30],
                  'string','Calcular Sistema',
                  'callback',{@RK4SYS2,S});

% sooo
% f = S.ed(8)
% g = S.ed(9)
% h = S.ed(10)
% quantity = S.ed(11)
% initials conditions
% x0 = S.ed(12)
% y0 = S.ed(13)

function RK4SYS2(varargin)
     print("executing RK4SYS2");
     S = varargin{3};
     input_f1 = get(S.ed(8),'string');
     f="@(t,y,z)";
     f=eval(strcat(f,input_f1))

     input_g1 = get(S.ed(9),'string');
     g="@(t,y,z)";
     g=eval(strcat(g,input_g1))
     
     t0=0;
     h = str2double(get(S.ed(10),'string'));
     quantity = str2double(get(S.ed(11),'string'));
     x0=str2double(get(S.ed(12),'string'));
     y0=str2double(get(S.ed(13),'string'));
     N=t0:h:h*quantity
     tt=N
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

% endfunction

function rk4(varargin)
S = varargin{3};
f1= get(S.ed(1),'string');
f2="@(y,x)";
f=eval(strcat(f2,f1));
a=str2double(get(S.ed(2),'string'));
b=str2double(get(S.ed(3),'string'));
y0=str2double(get(S.ed(4),'string'));
h=str2double(get(S.ed(5),'string'));

Pasos = int16((b-a)/h) %Tamaño del paso.
T=zeros(1, Pasos+1);
Y=zeros(1, Pasos+1);
T = a: h: b;
Y(1) = y0;
for k = 1:Pasos
f1 = feval(f, T(k), Y(k));
f2 = feval(f, T(k) + h/2, Y(k) + (h/2)*f1);
f3 = feval(f, T(k) + h/2, Y(k) + (h/2)*f2);
f4 = feval(f, T(k) + h, Y(k) + (h/2)*f3);
Y(k+1) = Y(k) + (h/6)*(f1 + 2*(f2 + f3) + f4);
endfor

R = [T' Y']

round_digit = 3;
if exist('OCTAVE_VERSION', 'builtin') ~= 0;
     T = T.*(10^(round_digit));
     Y = Y.*(10^(round_digit));
     T = floor(T);
     Y = floor(Y);
     T = T.*(10^(-round_digit));
     Y = Y.*(10^(-round_digit));
else
     T = round(T, round_digit);
     Y = round(Y, round_digit);
end
E=[];

set(S.lsX,'string',num2str(T'));
set(S.lsY,'string',num2str(Y'));
S.plot=plot(T,Y,"*b");
%S.plot=plotxlabel ("X");
%S.plot=plotylabel ("Y");
%S.plot=plottitle ("GRAFICO");
set(S.ed(6),'string',num2str(Y(end)));




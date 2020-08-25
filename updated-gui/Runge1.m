function [] = Runge1()

S.fh = figure('units','pixels',
              'position',[5 10 900 700],
              'menubar','none',
              'name','Runge Kutta',
              'numbertitle','off',
              'resize','off');

COL = get(S.fh,'color');          
S.ax = axes ("position", [0.1 0.45 0.5 0.5]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
S.ed(1) = uicontrol('style','edit',
                    'units','pix',
                    'position',[5 230 170 30],
                    'string','x^2+2*y');

S.tx(1) = uicontrol('style','text',
                    'units','pix',
                    'position',[20 260 150 30],
                    'string','Ecuacion Diferencial',
                    'fontsize',10,
                    'backgroundcolor',COL);
% System of differential equations
% 1st Equation
S.ed(8) = uicontrol('style','edit',
                   'units','pix',
                    'position',[5 170 170 30],
                    'string','y-4*z');

S.tx(8) = uicontrol('style','text',
                    'units','pix',
                    'position',[2 200 200 30],
                    'string','Sistemas de ecuaciones',
                    'fontsize',10,
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
                    'fontsize',10,
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
                    'fontsize',10,
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
                    'fontsize',10,
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

% 3rth order differential equation
% RK4 sys 3
S.tx(12) = uicontrol('style','text',
                    'units','pix',
                    'position',[20 110 250 30],
                    'string','Ecuacion diferencial de tercer orden',
                    'fontsize',10,
                    'backgroundcolor',COL);

% y''' coeficient
% input                  
S.ed(15) = uicontrol('style','edit',
                   'units','pix',
                    'position',[5 80 50 30],
                    'string','1');
                    
S.tx(13) = uicontrol('style','text',
                    'units','pix',
                    'position',[50 80 30 30],
                    'string',"y''' +",
                    'fontsize',10,
                    'backgroundcolor',COL);
% y'' coeficient
% input                  
S.ed(16) = uicontrol('style','edit',
                   'units','pix',
                    'position',[90 80 50 30],
                    'string','3');

S.tx(15) = uicontrol('style','text',
                    'units','pix',
                    'position',[140 80 30 30],
                    'string',"y'' +",
                    'fontsize',10,
                    'backgroundcolor',COL);
% y' coeficient
% input                  
S.ed(17) = uicontrol('style','edit',
                   'units','pix',
                    'position',[170 80 50 30],
                    'string','3');

S.tx(16) = uicontrol('style','text',
                    'units','pix',
                    'position',[220 80 30 30],
                    'string',"y' +",
                    'fontsize',10,
                    'backgroundcolor',COL);
% y coeficient
% input                  
S.ed(18) = uicontrol('style','edit',
                   'units','pix',
                    'position',[250 80 50 30],
                    'string','1');

S.tx(19) = uicontrol('style','text',
                    'units','pix',
                    'position',[300 80 30 30],
                    'string',"y = ",
                    'fontsize',10,
                    'backgroundcolor',COL);
% assignment
% input                  
S.ed(19) = uicontrol('style','edit',
                   'units','pix',
                    'position',[330 80 50 30],
                    'string','1+e^(2*t)');

% y(0) init
% input                  
S.ed(20) = uicontrol('style','edit',
                   'units','pix',
                    'position',[430 80 50 30],
                    'string','0');

S.tx(20) = uicontrol('style','text',
                    'units','pix',
                    'position',[380 80 50 30],
                    'string',"; y(0)=",
                    'fontsize',10,
                    'backgroundcolor',COL);
% y'(0) init
% input                  
S.ed(21) = uicontrol('style','edit',
                   'units','pix',
                    'position',[520 80 50 30],
                    'string','0');

S.tx(21) = uicontrol('style','text',
                    'units','pix',
                    'position',[480 80 50 30],
                    'string',"; y'(0)=",
                    'fontsize',10,
                    'backgroundcolor',COL);
% y''(0) init
% input                  
S.ed(22) = uicontrol('style','edit',
                   'units','pix',
                    'position',[620 80 50 30],
                    'string','0');

S.tx(22) = uicontrol('style','text',
                    'units','pix',
                    'position',[570 80 50 30],
                    'string',"; y''(0)=",
                    'fontsize',10,
                    'backgroundcolor',COL);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                  
S.ed(2) = uicontrol('style','edit',
                    'units','pix',
                    'position',[180 230 40 30],
                    'string','0');  
S.tx(2) = uicontrol('style','text',
                    'units','pix',
                    'position',[190 260 20 30],
                    'string','Xo',
                    'fontsize',10,
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
                    'fontsize',10,
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
                    'fontsize',10,
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
                    'fontsize',10,
                    'backgroundcolor',COL);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%       
%S.ed(6) = uicontrol('style','edit',
                %    'units','pix',
                %    'position',[380 230 190 30],
                %    'string','Respuesta');

S.lsX = uicontrol('style','listbox',
                 'units','pix',
                 'position',[600 250 80 400],
                 'backgroundcolor','w');

S.lsY1 = uicontrol('style','listbox',
                 'units','pix',
                 'position',[700 250 80 400],
                 'backgroundcolor','w');
                 
S.lsY2 = uicontrol('style','listbox',
                 'units','pix',
                 'position',[800 250 80 400],
                 'backgroundcolor','w');
                 
S.tx(6) = uicontrol('style','text',
                    'units','pix',
                    'position',[600 650 20 30],
                    'string','X',
                    'fontsize',10,
                    'backgroundcolor',COL);

S.tx(7) = uicontrol('style','text',
                    'units','pix',
                    'position',[700 650 20 30],
                    'string','Y1',
                    'fontsize',10,
                    'backgroundcolor',COL);
S.tx(117) = uicontrol('style','text',
                    'units','pix',
                    'position',[800 650 20 30],
                    'string','Y2',
                    'fontsize',10,
                    'backgroundcolor',COL);
                    
S.pb = uicontrol('style','push',
                  'units','pix',
                  'position',[160 20 120 30],
                  'string','Calcular Ecuacion',
                  'callback',{@rk4,S});
% sys
S.pf = uicontrol('style','push',
                  'units','pix',
                  'position',[310 20 120 30],
                  'string','Calcular Sistema',
                  'callback',{@RK4SYS2,S});
% 3th orden
S.pf = uicontrol('style','push',
                  'units','pix',
                  'position',[450 20 180 30],
                  'string','Calc ecuacion 3er orden',
                  'callback',{@RKSYS3,S});
% coef4 = S.ed(15) 
% coef3 = S.ed(16) 
% coef2 = S.ed(17) 
% coef1 = S.ed(18) 
% assgn = S.ed(19) 
% y(0) = S.ed(20) 
% y'(0) = S.ed(21) 
% y''(0) = S.ed(22) 
function RKSYS3(varargin)
     S         = varargin{3};
     h         = str2double(get(S.ed(10),'string'));
     quantity  = str2double(get(S.ed(11),'string'));
     coef1     = (get(S.ed(18),'string'));
     coef2     = (get(S.ed(17),'string'));
     coef3     = (get(S.ed(16),'string'));
     coef4     = (get(S.ed(15),'string'));
     assgn     = (get(S.ed(19),'string'));
     x0        = eval(get(S.ed(20),'string'));
     y0        = eval(get(S.ed(21),'string'));
     z0        = eval(get(S.ed(22),'string'));

     f=@(t,x,y,z) y;
     g=@(t,x,y,z) z;
     q=@(t,x,y,z) (eval(assgn)-eval(coef1)*x-eval(coef2)*y-eval(coef3)*z)/eval(coef4);
     t0=0;
     tt=t0:h:h*quantity;
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
  S.plot = plot (tt,x,'-r');
  set(S.lsX,'string',num2str(tt'));
  set(S.lsY1,'string',num2str(x'));
  set(S.lsY2,'string'," ");


% sooo
% f = S.ed(8)
% g = S.ed(9)
% h = S.ed(10)
% quantity = S.ed(11)
% initials conditions
% x0 = S.ed(12)
% y0 = S.ed(13)

function RK4SYS2(varargin)
     %print("executing RK4SYS2");
     S = varargin{3};
     input_f1 = get(S.ed(8),'string');
     f="@(t,y,z)";
     f=eval(strcat(f,input_f1));

     input_g1 = get(S.ed(9),'string');
     g="@(t,y,z)";
     g=eval(strcat(g,input_g1));
     
     t0=0;
     h = str2double(get(S.ed(10),'string'));
     quantity = str2double(get(S.ed(11),'string'));
     x0=str2double(get(S.ed(12),'string'));
     y0=str2double(get(S.ed(13),'string'));
     N=t0:h:h*quantity;
     tt=N;
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
     S.plot = plot (tt,x,'-r',tt,y,'-b');
     set(S.lsX,'string',num2str(tt'));
     set(S.lsY1,'string',num2str(x'));
     set(S.lsY2,'string',num2str(y'));
    % for i=1:n
          %hold on
          %S.plot=plot(tt(i),x(i),'*r');
         % hold on
        %  S.plot=plot(tt(i),y(i),'*b');
           %set (S.plot, 'YData', y);
  %        set (h, 'YData', y);
  %   endfor
    % hold on
    % grid on

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

Pasos = int16((b-a)/h); %Tamaño del paso.
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

R = [T' Y'];

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
set(S.lsY1,'string',num2str(Y'));
set(S.lsY2,'string'," ");
S.plot=plot(T,Y,"-b");
%S.plot=plotxlabel ("X");
%S.plot=plotylabel ("Y");
%S.plot=plottitle ("GRAFICO");
%set(S.ed(6),'string',num2str(Y(end)));




function [] = Runge()

S.fh = figure('units','pixels',
              'position',[400 200 600 500],
              'menubar','none',
              'name','Runge Kutta',
              'numbertitle','off',
              'resize','off');

COL = get(S.fh,'color');          
S.ax = axes ("position", [0.1 0.4 0.5 0.5]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
S.ed(1) = uicontrol('style','edit',
                    'units','pix',
                    'position',[5 90 170 30],
                    'string','3');
S.tx(1) = uicontrol('style','text',
                    'units','pix',
                    'position',[20 120 100 30],
                    'string','Ecuacion',
                    'fontsize',11,
                    'backgroundcolor',COL);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                  
S.ed(2) = uicontrol('style','edit',
                    'units','pix',
                    'position',[180 90 40 30],
                    'string','0');  
S.tx(2) = uicontrol('style','text',
                    'units','pix',
                    'position',[190 120 20 30],
                    'string','Xo',
                    'fontsize',11,
                    'backgroundcolor',COL);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
S.ed(3) = uicontrol('style','edit',
                    'units','pix',
                    'position',[230 90 40 30],
                    'string','1');  
S.tx(3) = uicontrol('style','text',
                    'units','pix',
                    'position',[240 120 20 30],
                    'string','Xf',
                    'fontsize',11,
                    'backgroundcolor',COL);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
S.ed(4) = uicontrol('style','edit',
                    'units','pix',
                    'position',[280 90 40 30],
                    'string','0');  
S.tx(4) = uicontrol('style','text',
                    'units','pix',
                    'position',[290 120 20 30],
                    'string','Y',
                    'fontsize',11,
                    'backgroundcolor',COL);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
S.ed(5) = uicontrol('style','edit',
                    'units','pix',
                    'position',[330 90 40 30],
                    'string','0.2');  
S.tx(5) = uicontrol('style','text',
                    'units','pix',
                    'position',[340 120 20 30],
                    'string','h',
                    'fontsize',11,
                    'backgroundcolor',COL);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%       
S.ed(6) = uicontrol('style','edit',
                    'units','pix',
                    'position',[380 90 190 30],
                    'string','Respuesta');
S.lsX = uicontrol('style','listbox',
                 'units','pix',
                 'position',[399 200 70 250],
                 'backgroundcolor','w');
S.lsY = uicontrol('style','listbox',
                 'units','pix',
                 'position',[480 200 70 250],
                 'backgroundcolor','w');
S.tx(6) = uicontrol('style','text',
                    'units','pix',
                    'position',[425 455 20 30],
                    'string','X',
                    'fontsize',11,
                    'backgroundcolor',COL);
S.tx(7) = uicontrol('style','text',
                    'units','pix',
                    'position',[500 455 20 30],
                    'string','Y',
                    'fontsize',11,
                    'backgroundcolor',COL);
S.pb = uicontrol('style','push',
                  'units','pix',
                  'position',[160 20 120 30],
                  'string','Calcular',
                  'callback',{@rk4,S});             

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
S.plot=plot(T,Y);
%S.plot=plotxlabel ("X");
%S.plot=plotylabel ("Y");
%S.plot=plottitle ("GRAFICO");
set(S.ed(6),'string',num2str(Y(end)));

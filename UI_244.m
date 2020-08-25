%UI 244
option = input (" 1 -> resolver un sistema de ecuaciones diferenciales\n 2 -> resolver una ecuacion diferencial de orden superior\n \"1 2\"\n ", "s");
if (option=="1")
  f = input("Ecuacion 1 escriba * + - / si es necessario:\n> y'=","s");
  f = f(~isspace(f));
  prev = f(1);
  ff = "f=@(t,x,y,z)";
  fg = "g=@(t,x,y,z)";
  n = length(ff);
  n=n+1;
  for i=1:length(f)
    if(f(i)=="+" || f(i)=="-" || f(i)=="^" || f(i)=="*" || f(i)=="/")
      ff(n)=f(i);
    elseif(isdigit(f(i)))
      ff(n)=f(i);
    elseif(f(i) == "y")
      ff(n) = "x";
    elseif(f(i) == "z")
      ff(n) = "y";
    end
    n=n+1;
  endfor
  n=length(fg);
  n++;
  g = input("Ecuacion 2 excriba * + - / si es necessario:\n> z'=","s");
  g = g(~isspace(g)); 
  for i=1:length(g)
    if(g(i)=="+" || g(i)=="-" || g(i)=="^" || g(i)=="*" || g(i)=="/")
      fg(n)=g(i);
    elseif(isdigit(g(i)))
      fg(n)=g(i);
    elseif(g(i) == "y")
      fg(n) = "x";
    elseif(g(i) == "z")
      fg(n) = "y";
    end
    n=n+1;
  endfor
  x0 = input("Condicional inicial 1:\n> ","f");
  x0 = eval(x0);
  y0 = input("Condicional inicial 2:\n> ","f");
  y0 = eval(y0);
  h = input("tamano de paso: \n> ","f");
  h = eval(h);
  To = input("Cuantos pasos?:\n> ","f");
  To= eval(To);
  ff = eval(ff)
  fg = eval(fg)
  disp(x0)
  disp(y0)
  disp(h)
  disp(To)
  t0=0;
  total = h*To;
  N = 0:h:total
  RK4Sistemas2(ff,fg,t0,x0,y0,N);
endif
if (option == "2")
  orden = input("Orden de la ecucacion 2 o 3?: ","d")
  if (orden == "2")
    coef1 = eval(input("Ingrese el coeficiente para y:\n >","f"));
    coef2 = eval(input("Ingrese el coeficiente para y':\n >","f"));
    coef3 = eval(input("Ingrese el coeficiente para y'':\n >","f"));
    igualdad = eval(input("Ingrese la igualdad * / - exp si es necesario:\n >","f"));
    condicion1 = eval(input("Ingrese la condicion inicial para y(0) \n>","f"));
    condicion2 = eval(input("Ingrese la condicion inicial para y'(0) \n>","f"));
    h = input("tamano de paso: \n> ","f");
    h = eval(h);
    To = input("Cuantos pasos?:\n> ","f");
    To= eval(To);
    f = @(t,x,y,z) coef1*y;
    g = @(t,x,y,z) (igualdad-coef2*x-coef1*y)/coef3;
    t0=0;
    total = h*To;
    x0=condicion1;
    y0=condicion2;
    N=0:h:total;
    RK4Sistemas2(f,g,t0,x0,y0,N);
  elseif (orden == "3")
    coef1 = eval(input("Ingrese el coeficiente para y:\n >","f"));
    coef2 = eval(input("Ingrese el coeficiente para y':\n >","f"));
    coef3 = eval(input("Ingrese el coeficiente para y'':\n >","f"));
    coef4 = eval(input("Ingrese el coeficiente para y''':\n >","f"));
    igualdad = (input("Ingrese la igualdad * / - exp si es necesario en terminos de t:\n >","s"));
    condicion1 = eval(input("Ingrese la condicion inicial para y(0) \n>","f"));
    condicion2 = eval(input("Ingrese la condicion inicial para y'(0) \n>","f"));
    condicion3 = eval(input("Ingrese la condicion inicial para y''(0) \n>","f"));
    h = input("tamano de paso: \n> ","f");
    h = eval(h);
    To = input("Cuantos pasos?:\n> ","f");
    To= eval(To);
    printf("Coeficiente 1:\n")
    disp(coef1)
    printf("Coeficiente 2:\n")
    disp(coef2)
    printf("Coeficiente 3:\n")
    disp(coef3)
    printf("Coeficiente 4:\n")
    disp(coef4)
    f = @(t,x,y,z) y
    g = @(t,x,y,z) z
    z = @(t,x,y,z) (eval(igualdad)-coef1*x-coef2*y-coef3*z)/coef4
    t0 = 0;
    total = h*To;
    x0 = condicion1;
    y0 = condicion2;
    z0 = condicion3;
    N=0:h:total;
    RK4Sistemas3(f,g,z,t0,x0,y0,z0,N);
  end
end
%UI 244
%printf("SYS para resolver un sistema de ecuaciones diferenciales\n")
%printf("EQ resover una ecuacion diferencial de orden superior\n");
option = input (" 1 -> resolver un sistema de ecuaciones diferenciales\n 2 -> resolver una ecuacion diferencial de orden superior\n \"1 2\"\n ", "s");
if (option=="1")
  f = input("Ecuacion 1:\n> y'=","s");
  f = f(~isspace(f)); 
  for i=1:length(f)-1
    disp(f(i))
  endfor
  g = input("Ecuacion 2:\n> z'=","s");
  g = g(~isspace(g)); 
  x0 = input("Condicional inicial 1:\n> ","d");
  y0 = input("Condicional inicial 2:\n> ","d");
  disp(f)
  disp(g)
  disp(x0)
  disp(y0)
  %if ()
%  First = fgetl(stdin);
 %if (line == "y'=y-4z")
endif
function [x_star f_star num_iter] = newtonsearch(fun, guess, tol, max_iter)

derivada = @(x) (fun(x+tol) - fun(x-tol))/(2*tol);
derivada2da = @(x) (derivada(x+tol) - derivada(x-tol))/(2*tol);
xold = guess;
xnew = xold - derivada(xold)/derivada2da(xold);
num_iter = 0;

while((abs(xnew - xold) > tol || abs(fun(xnew) - fun(xold)) > tol) && num_iter < max_iter)
  num_iter = num_iter + 1;
  xnew = xold - derivada(xold)/derivada2da(xold);
  xold = xnew;
endwhile

#se minimo
if (derivada2da(xold) > 0 && num_iter < max_iter)
  x_star = xnew;
  f_star = fun(xnew);

else
  fprintf("O metodo de busca de newton nao convergiu para ponto de minimo.\n\tPonto obtido: %d\n\tDerivada: %d\n\tSegunda derivada: %d\n", xnew, derivada(xnew), derivada2da(xnew));
  x_star = NaN;
  f_star = NaN;  
endif


endfunction
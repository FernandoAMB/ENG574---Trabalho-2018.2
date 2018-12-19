function [x_star f_star n_iter] = gradOtimo(fun, guess, tol, max_iter)
  ddescida = @(x) (-grad(fun,x, tol));
  xold = guess;
  n_iter = 0;
  
  while (norm(grad(fun, xold, tol)) >= tol && n_iter < max_iter)
    d = -grad(fun,xold, tol);
    g_a = @(a)(fun(xold + a*d));
    for i = 1:100
      x(i) = (i-1)/10;
      f(i) = g_a(x(i));  
    endfor
    plot(x,f);
    alfa = falseposition(g_a, 2, tol, 30);
    xnew = xold - alfa*d;
    xold = xnew;
    n_iter = n_iter + 1;
    fprintf("x = %f %f %f\nf(x) = %f\n", xold, fun(xold));
  endwhile
  
  x_star = xold;
  f_star = fun(xold);
  
endfunction

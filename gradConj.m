function [x_star, f_star] = gradConj(fun, guess, tol)
  alfa_max = 1;
  xold = guess;
  g = @(x) (grad(fun, x, tol));
  d = -g(xold);
  while (norm(g(xold)) > tol)
    for i = 0:length(guess)
      alfa = fibonacci_search(@(x) (fun(xold + x*d)), 0, alfa_max, tol)
      xnew = xold + alfa*d;
      if (i < length(guess) - 1)
        beta = g(xnew)'*hessian(fun, xold, tol)*d;
        d = -g(xnew) + beta*d;
      else 
        d = -g(xnew);
      endif
      xold = xnew;
    endfor
  endwhile
  x_star = xold;
  f_star = fun(xold);

endfunction
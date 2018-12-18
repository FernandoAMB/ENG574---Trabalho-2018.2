function [x_star, f_star num_iter] = falseposition(fun, guess, tol, max_iter)
  deriv = @(x) (fun(x + tol) - fun(x - tol))/(2*tol);
  x2old = guess;
  num_iter = 0;
  deriv2 = (deriv(x2old+tol) - deriv(x2old-tol))/(2*tol);
  xold = x2old - deriv(x2old)/deriv2; %calculando um ponto por newton
  approx_2deriv = (deriv(x2old) - deriv(xold))/(x2old - xold);
  xnew = xold - deriv(xold)/approx_2deriv;
  while (abs(xnew - xold) > tol && num_iter <= max_iter)
    x2old = xold;
    xold = xnew;
    approx_2deriv = (deriv(x2old) - deriv(xold))/(x2old - xold);
    xnew = xold - deriv(xold)/approx_2deriv;
    num_iter = num_iter + 1;
  endwhile
  
  if (num_iter <= max_iter)
      x_star = xnew;
      f_star = fun(x_star);
      return;
  endif
    %return NaN if didn't converge
    x_star = NaN;
    f_star = NaN;

endfunction
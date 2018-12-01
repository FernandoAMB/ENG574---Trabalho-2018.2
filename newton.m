## Copyright (C) 2018 Fernando
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {Function File} {@var{retval} =} newton (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Fernando <fernando@fernando-linux>
## Created: 2018-11-16

function [x_star, f_star] = newton (fun, guess ,tol, max_iter)
  
  %colocando guess no formato certo
  if (columns(guess) > 1)
    xold = guess';
  else
    xold = guess;
  endif
  
  
  der = grad(fun, xold, tol);
   if (norm(der) != 0)
    xnew = xold - (hessian(fun, xold, tol)\grad(fun, xold, tol));
    num_iter = 0;
    while (num_iter < max_iter && (norm(xnew - xold) > tol))
     der = grad(fun, xold, tol);
     
     if (norm(der) != 0)
       xnew = xold - hessian(fun, xold, tol)\der;
       num_iter = num_iter + 1;
       xold = xnew;
     else
      break;
     endif
    endwhile
    if (num_iter < max_iter)
      x_star = xnew;
      f_star = fun(x_star);
      return;
    endif
   endif
    %return NaN if didn't converge
    x_star = NaN;
    f_star = NaN;
  
endfunction

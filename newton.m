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
  xold = guess;
  der = grad(fun, xold, tol);
   if (norm(der) != 0)
    xnew = xold - grad(fun, xold, tol)'*inv(hessian(fun, xold, tol));
    num_iter = 1;
    while (num_iter < max_iter && (abs(xnew - xold) > tol))
     der = grad(fun, xold, tol);
     if (norm(der) != 0)
       xnew = xold - der'*inv(hessian(fun, xold, tol));
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
    %return NaN if didn't converge
    x_star = NaN;
    f_star = NaN;
  endif
  
endfunction

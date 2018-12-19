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
## @deftypefn {Function File} {@var{retval} =} fibonacci_search (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Fernando <fernando@fernando-linux>
## Created: 2018-11-16

function [x_star, f_star, num_iter] = fibonacci_search (fun, lower_bound, upper_bound, range_tolerance)
  [series, index] = fibonacci(lower_bound, upper_bound, range_tolerance);
  series
  alfa_lower = lower_bound;
  alfa_upper = upper_bound;
  num_iter = index;
  delta(1) = (alfa_upper - alfa_lower);
  for i = 2:index
    delta(i) = delta(1)*series(index - i + 1)/series(index);
  endfor
  delta
  x1=alfa_lower + delta(2);
  x2=alfa_upper - delta(2);
  for i = 3:index
    if (fun(x1) > fun(x2))
      alfa_lower = x2;
      x2=x1;
      x1=alfa_lower + delta(i);
    elseif (fun(x1) <= fun(x2))
      alfa_upper = x1;
      x1=x2;
      x2=alfa_upper - delta(i);
    endif

  endfor
  
  
  x_star = (alfa_lower + alfa_upper)/2;
  f_star = fun(x_star);
  
  

endfunction

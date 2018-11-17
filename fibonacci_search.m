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

function [lower, upper] = fibonacci_search (fun, lower_bound, upper_bound, range_tolerance)
  [series, index] = fibonacci(lower_bound, upper_bound, range_tolerance);
  deltas = (upper_bound - lower_bound)*series(index:-1:1)/series(index) # calculo dos deltas no metodo
  alfa_lower = lower_bound;
  alfa_upper = upper_bound;
  for i = 2:length(deltas)
    alfa_lower_temp = alfa_lower + deltas(i);
    alfa_upper_temp = alfa_upper - deltas(i);
    if (fun(alfa_lower_temp) > fun(alfa_upper_temp))
      alfa_upper = alfa_lower_temp;
    elseif (fun(alfa_lower_temp) < fun(alfa_upper_temp))
      alfa_lower = alfa_upper_temp;  
    endif
    if (alfa_lower > alfa_upper)
        temp = alfa_lower;
        alfa_lower = alfa_upper;
        alfa_upper = temp;
    endif
  endfor
  lower = alfa_lower;
  upper = alfa_upper;
  
  

endfunction

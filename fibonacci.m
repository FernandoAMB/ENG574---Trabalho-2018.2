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
## @deftypefn {Function File} {@var{retval} =} fibonacci (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Fernando <fernando@fernando-linux>
## Created: 2018-11-16

function [series, indice] = fibonacci (lower_bound, upper_bound, tolerance)
  delta = upper_bound - lower_bound;
  a(1) = 1;
  a(2) = 1;
  indice = 3;
  while (a(indice - 1) <= delta/tolerance)
    a(indice) = a(indice-1) + a(indice-2);
    indice = indice + 1;
  endwhile
  series = a(2:indice - 1); % removendo o primeiro 1
  indice = indice - 2;
endfunction

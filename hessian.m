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
## @deftypefn {Function File} {@var{retval} =} hessian (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Fernando <fernando@fernando-linux>
## Created: 2018-11-16

## Funcao hessiana.
## Argumentos:
## fun: handle da funcao para calcular a hessiana.
## point: ponto no qual a hessiana da funcao sera calculada
## tol: tolerancia da funcao

function retval = hessian (fun, point, tol)
  retval = zeros(length(point), length(point));
  for i = 1:length(point)
    temp  = point;
    temp2 = point;
    temp(i) = temp(i) + tol;
    temp2(i) = temp2(i) - tol;
    retval(i, 1:length(point)) = ((grad(fun, temp, tol) - grad(fun, temp2, tol))./(2*tol))';
   endfor

endfunction

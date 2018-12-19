clear;close;clc;
possible_x0 = [[-0.5 -0.5 -0.5];[0 0 0];[0.3 0.3 0.3];[0.5 0.5 0.5];[0.9 0.9 0.9];[1.3 1.3 1.3]];

gradient = grad(@f, possible_x0(3, :), 0.001);
d0 = -gradient/norm(gradient);
hess = hessian(@f, possible_x0(3, :), 0.1);

fprintf("d0 = %f\n", d0);

fun_a = @(a)(f([0.5 0.5 0.5] + a*d0));
fprintf("Falsa Posicao:\n\t\tx0\t\t\tAlfa\t\tNumero de iteracoes\n");
for i = 1:length(possible_x0)
  gradient = grad(@f, possible_x0(i, :), 0.001);
  d0 = -gradient/norm(gradient);
  fun_a = @(a)(f(possible_x0(i, :) + a*d0));
  [x_falsepos, f_falsepos, iter_falsepos] = falseposition(fun_a, 0, 1e-3, 100);
  fprintf("%f %f %f\t\t%f\t%d\n", possible_x0(i, :), x_falsepos, iter_falsepos);
endfor


[x_fib, f_fib, iter_fib] = fibonacci_search(fun_a, 0, 10, 1e-3);
##timeNewton = 0;
##for i = 1:100
##  tic();
##  [x_newton, f_newton, iter_newton] = newtonsearch(fun_a, 0, 1e-3, 100);
##  timeNewton = timeNewton + toc();
##endfor
##timeNewton = timeNewton/100; #calculando a media
##
##timeFp = 0;
##for i = 1:100
##  tic();
##  [x_falsepos, f_falsepos, iter_falsepos] = falseposition(fun_a, 0, 1e-3, 100);
##  timeFp = timeFp + toc();
##endfor
##timeFp = timeFp/100;
##
##timeFibonacci = 0;
##for i = 1:100
##  tic();
##  [x_fib, f_fib, iter_fib] = fibonacci_search(fun_a, 0, 10, 1e-3);
##  timeFibonacci = timeFibonacci + toc();
##endfor
##
##fprintf("Falsa Posicao:\nAlfa Inicial\tAlfa Final\t\tNumero de iteracoes\n");
##for i = 0:0.2:1.1
##  [x_falsepos, f_falsepos, iter_falsepos] = falseposition(fun_a, i, 1e-3, 100);
##  fprintf("%f\t%f\t\t%d\n", i, x_falsepos, iter_falsepos);
##endfor
##

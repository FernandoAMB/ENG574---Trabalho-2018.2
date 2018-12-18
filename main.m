clear;close;clc;
gradient = grad(@f, [0.5, 0.5, 0.5], 0.001);
d0 = -gradient/norm(gradient);
hess = hessian(@f, [0.5, 0.5, 0.5], 0.1);

fprintf("d0 = %f\n", d0);

fun_a = @(a)(f([0.5 0.5 0.5] + a*d0));

for i = 1:700
  x(i) = (i-200)/100;
  func(i) = fun_a((i-200)/100);
endfor
plot(x, func);
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

clear;close;clc;

x0 = [[0.1 0.1 0.1];[0.2 0.2 0.2];[0.5 0.5 0.5]; [0.9 0.9 0.9];[1 1 1]];


fprintf("Newton:\nx0\t\t\t\t\tx*\t\t\t\tf(x*)\t\tNum Iter\n");
for i = 1:5
  [x_star_n f_star_n n_iter_n] = newton(@f, x0(i,:), 1e-4, 100);
  fprintf("%f %f %f\t%f %f %f\t\t%f\t%d\n",x0(i,:),x_star_n, f_star_n, n_iter_n);
endfor
n_iter_n

grad(@f, x_star_n, 1e-4)
gradient = grad(@f, [0.5, 0.5, 0.5], 0.001)
norm(gradient)
d0 = gradient/norm(gradient)
hess = hessian(@f, [0.5, 0.5, 0.5], 0.1)

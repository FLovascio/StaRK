#=
Set the function to be solved in this file
D(f_i)=K(f_i)
F(f_i,f_{i+1},f_{i-1},h)=D(f_i)*XX(f_i,f_{i+1},f_{i-1},h)

also set the grid resolution:
h=--- 
=#

D(i)=i #diffusion coeficent takes only one argument
F(i,ip,im,H)=D(i)*d_xx(i,ip,im,H) + d_x(i,ip,im,H)*d_x(i,ip,im,H) #discretised PDE

h=0.1



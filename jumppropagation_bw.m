function [x_new, psi_new] = jumppropagation_bw(x_cur, x_targ)
%FLOWPROPAGATION Summary of this function goes here
%   Detailed explanation goes here
global U_D;
global rule;
global options;
global TSPAN_g;
global JSPAN_g;

m = size(U_D, 2);
I = ceil(m*rand());
u = U_D(:, I);
rule = 1;
[t,j,x] = HyEQsolver( @(x) f_bw(x, 0),@(x) g_bw(x, u),@C_bw,@D_bw,...
    x_cur,TSPAN_g,JSPAN_g,rule,options,'ode23t');
phi_new = [t, j, x]';
n = size(phi_new, 2);
psi_new = [phi_new; u * ones(1, n)];
x_new = phi_new(3:end, end);

end
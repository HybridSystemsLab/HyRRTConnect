function x_plus = g_bw_ext(xm, um)
%G_BW Summary of this function goes here
%   Detailed explanation goes here
options = optimset('Display','off');
x_plus = fsolve(@(z) g_eqn(z, xm, um), xm, options);

end


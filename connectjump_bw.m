function [u, i_1] = connectjump_bw(T_1, I_1_D, T_2, I_2)
%CONNECTJUMP Summary of this function goes here
%   Detailed explanation goes here
u = [];

x2 = T_2.get(I_2);
lambda = 0.8;
for I_1 = I_1_D
    x1 = T_1.get(I_1);
    u_temp = fsolve(@(u) g_eqn(x1, x2, u), 0, options);
    if u_temp >= 0 && u_temp <= 5
        u = u_temp;
        return;
    end
end

end


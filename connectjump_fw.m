function [u, I_2] = connectjump_fw(T_1, I_1, T_2, I_2_D)
%CONNECTJUMP Summary of this function goes here
%   Detailed explanation goes here
u = [];

x1 = T_1.get(I_1);
options = optimset('Display','off');
lambda = 0.8;

for I_2 = I_2_D
    x2 = T_2.get(I_2);
    u_temp = fsolve(@(u) g_eqn(x1, x2, u), 0, options);
    if u_temp >= 0 && u_temp <= 5
        u = u_temp;
        return;
    end
end

end


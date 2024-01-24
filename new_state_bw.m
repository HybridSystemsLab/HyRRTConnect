function [x_new, psi_new] = new_state_bw(x, x_near, flag)

if (flag == 0) %flow
    [x_new, psi_new] = flowpropagation_bw(x_near, x);
else % jump
    [x_new, psi_new] = jumppropagation_bw(x_near, x);
end


if (checkanyunsafe(psi_new, size(x_new, 1)))
    x_new = [];
    psi_new = [];
end

end
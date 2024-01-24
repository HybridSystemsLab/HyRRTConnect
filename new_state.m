function [x_new, psi_new] = new_state(x, x_near, flag)

if (flag == 0) %flow
    [x_new, psi_new] = flowpropagation(x_near, x);
else % jump
    [x_new, psi_new] = jumppropagation(x_near, x);
end
if (checkanyunsafe(psi_new, size(x_new, 1)))
    x_new = [];
    psi_new = [];
end

end
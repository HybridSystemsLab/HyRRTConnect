function [T, I_new, output_flag, edge_matrix, reachedset, x_new, psi_new] = extend_bw(T, x, edge_matrix, reachedset, flag_fg)
%% flow: flag_fg = 0; jump: flag_fg = 1.
% Inputs:
% T: RRT; 
% I_new: the index of the new vertex (0 if no vertex is added); 
% flag: 1 if a vertex is added, 0 if no vertex is added;
% edge_matrix: the updated edge map;
% reachedset: the updated reached set.

% Outputs:
% flag: 0 if trapped; 1 if reached; 2 if advanced.

% global plotflag;
I_new = 0;
x_new = [];
psi_new = [];
output_flag = 0;

I_near = nearest_neighbor(x, T, flag_fg);
if (isempty(I_near))
    return;
end

if (C_bwprime(T.get(I_near)) && ~D_bwprime(T.get(I_near)))
    [x_new, psi_new] = new_state_bw(x, T.get(I_near), 0);
end
if (D_bwprime(T.get(I_near)) && ~C_bwprime(T.get(I_near)))
    [x_new, psi_new] = new_state_bw(x, T.get(I_near), 1);
end
if (D_bwprime(T.get(I_near)) && C_bwprime(T.get(I_near)))
    pr = rand;
    if (pr < 0.5)
        [x_new, psi_new] = new_state_bw(x, T.get(I_near), 0);
    else
        [x_new, psi_new] = new_state_bw(x, T.get(I_near), 1);
    end
end

if ~isempty(x_new) %&& ~Isintree(x_new, I_near, reachedset)
    [T, I_new, edge_matrix, reachedset] = addnodeandedgetotree(T, I_near, x_new, psi_new, edge_matrix, reachedset);
%     if(1) 
%         plotsearchtreeatgrowing(psi_new, x, T.get(I_near), x_new);
%     end
    if (norm(x_new - x) < 0.3)
        output_flag = 1;
        return;
    else
        output_flag = 2;
        return
    end
end
end


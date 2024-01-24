function [T, I_new, edge_map, reachedset] = addnodeandedgetotree(T, I, x_new, psi_new, edge_map, reachedset)
%ADDEDGETOGRAPH Summary of this function goes here
%   Detailed explanation goes here
    [T, I_new, edge_map, reachedset] = addnodetograph(T, I, x_new, edge_map, reachedset);
    edge_map = addedgetograph(I,  I_new, edge_map, psi_new);
end


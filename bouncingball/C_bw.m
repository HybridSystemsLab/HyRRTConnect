function [value] = C_bw(x, u)
%C_BW Summary of this function goes here
%   Detailed explanation goes here

global backwardsystemdata_flag
if backwardsystemdata_flag
    value = C(x, u);
else
    value = C_bw_ext(x, u);
end

end


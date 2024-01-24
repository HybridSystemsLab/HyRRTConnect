function [value] = C_bwprime(x)
%C_BW Summary of this function goes here
%   Detailed explanation goes here

global backwardsystemdata_flag
if backwardsystemdata_flag
    value = C(x, 0);
else
    value = C_bw_ext(x, 0);
end

end


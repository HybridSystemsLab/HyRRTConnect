function [B0, B1] = computeSolutionMatrixB(xi, xf, tplus)
%COMPUTESOLUTIONMATRIXB Summary of this function goes here
%   Detailed explanation goes here
thetai = xi(1:3, :);
omegai = xi(4:6, :);

thetaf = xf(1:3, :);
omegaf = xf(4:6, :);

B0 = -2/tplus^2 * (3*(thetai - thetaf) + omegaf*tplus +2*omegai *tplus);
B1 = 1/tplus^3*(12*(thetaf - thetai -omegai*tplus)-6*tplus*(omegaf - omegai));

end


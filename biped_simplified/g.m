function xplus = g(x, u)
%G Summary of this function goes here
%   Detailed explanation goes here
    xplus = zeros(6,1);
    
    omegaminus = x(4:6, 1);
    [jumpD,jumpE] = computeJumpMatrix(x);
    dotz1minus = 0;
    dotz2minus = 0;
    dotqeminus = [omegaminus; dotz1minus;dotz2minus];
    out = [jumpD, -jumpE'; jumpE, zeros(2,2)]^(-1)*[jumpD*dotqeminus; zeros(2,1)];
    omegaplus = out(1:3,:);
    xplus(1, 1) = x(2, 1);
    xplus(2, 1) = x(1, 1);
    xplus(3, 1) = x(3, 1);
    xplus(4, 1) = omegaplus(2);
    xplus(5, 1) = omegaplus(1);
    xplus(6, 1) = omegaplus(3);
end


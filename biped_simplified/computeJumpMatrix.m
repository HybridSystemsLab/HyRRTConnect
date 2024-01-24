function [jumpD,jumpE] = computeJumpMatrix(x)
%COMPUTEJUMPMATRIX Summary of this function goes here
%   Detailed explanation goes here
global params
theta1 = x(1);
theta2 = x(2);
theta3 = x(3);

% shortened sin / cos definitions
s12 = sin(theta1 - theta2);
s13 = sin(theta1 - theta3);
c12 = cos(theta1 - theta2);
c13 = cos(theta1 - theta3);

% matrix D definition
D11 = ((5/4)*params.mL + params.mH + params.mT)*params.lL^2;
D12 = -.5 * params.mL * params.lL^2 * c12;
D13 = params.mT * params.lL * params.lT * c13;
D14 = ((3/2) * params.mL + params.mH + params.mT) * params.lL * cos(theta1);
D15 = -(1.5 * params.mL + params.mH + params.mT) * params.lL * sin(theta1);
D21 = D12;
D22 = .25 * params.mL * params.lL^2;
D23 = 0;
D24 = -.5 * params.mL * params.lL * cos(theta2);
D25 = .5 * params.mL * params.lL * sin(theta2);
D31 = D13;
D32 = D23;
D33 = params.mT * params.lT^2;
D34 = params.mT * params.lT * cos(theta3);
D35 = -params.mT * params.lT * sin(theta3);
D41 = D14;
D42 = D24;
D43 = D34;
D44 = 2 * params.mL + params.mH + params.mT;
D45 = 0;
D51 = D15;
D52 = D25;
D53 = D35;
D54 = D45;
D55 = 2*params.mL + params.mH + params.mT;

jumpD = [D11,D12,D13,D14,D15;D21,D22,D23,D24,D25;D31,D32,D33,D34,D35;D41,D42,D43,D44,D45;D51,D52,D53,D54,D55];

% matrix E definition
jumpE = [params.lL * cos(theta1), -params.lL*cos(theta2),0,1,0;-params.lL*sin(theta1),params.lL*sin(theta2),0,0,1];
% jumpEmod = [params.lL * cos(theta1), -params.lL*cos(theta2),0;-params.lL*sin(theta1),params.lL*sin(theta2),0];
end


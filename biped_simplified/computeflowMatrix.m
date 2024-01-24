function [D, C, G, B] = computeflowMatrix(x)
%COMPUTEFLOWMATRIX Summary of this function goes here
%   Detailed explanation goes here
global params

theta1 = x(1);
theta2 = x(2);
theta3 = x(3);

omega1 = x(4);
omega2 = x(5);
omega3 = x(6);


% shortened sin / cos definitions
s12 = sin(theta1 - theta2);
s13 = sin(theta1 - theta3);
c12 = cos(theta1 - theta2);
c13 = cos(theta1 - theta3);

% matrix D definition
D11 = ((5/4)*params.mL + params.mH + params.mT)*params.lL^2;
D12 = -.5 * params.mL * params.lL^2 * c12;
D13 = params.mT * params.lL * params.lT * c13;
D21 = D12;
D22 = .25 * params.mL * params.lL^2;
D23 = 0;
D31 = D13;
D32 = D23;
D33 = params.mT * params.lT^2;
D = [D11,D12,D13;D21,D22,D23;D31,D32,D33];

C11 = 0;
C12 = -.5 * params.mL * params.lL^2 * s12 * omega2;
C13 = params.mT * params.lL * params.lT * s13 * omega3;
C21 = .5 * params.mL * params.lL^2 * s12 * omega1;
C22 = 0;
C23 = 0;
C31 = -params.mT * params.lL * params.lT * s13 * omega1;
C32 = 0;
C33 = 0;

C = [C11, C12, C13; C21, C22, C23; C31, C32, C33];

G11 = -.5*params.g*(2*params.mH + 3*params.mL + 2*params.mT)*params.lL*sin(theta1);
G12 = .5*params.g*params.mL*params.lL*sin(theta2);
G13 = - params.g * params.mT* params.lT*sin(theta3);

G = [G11; G12; G13];

B = [1, 0, 0 ; 0, 1, 0; 0, 0, 1 ];

end


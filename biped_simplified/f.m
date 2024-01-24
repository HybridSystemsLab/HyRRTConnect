function dotx = f(x,u)
%F Summary of this function goes here
%   Detailed explanation goes here
dotx = zeros(6, 1);

% x1 = x(1);%theta1
% x2 = x(2);%theta2
% x3 = x(3);%theta3
x4 = x(4);%omega1
x5 = x(5);%omega2
x6 = x(6);%omega3
%
omega = [x4; x5; x6];
% u1 = u(1);
% u2 = u(2);
% u3 = u(3);
% u4 = u(4);
% u5 = u(5);
% u6 = u(6);

dotx(1:3, 1) = omega;

dotx(4:6, 1) = [u(1); u(2); u(3)];

end


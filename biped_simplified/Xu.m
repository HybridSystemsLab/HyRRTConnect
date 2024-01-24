function output = Xu(x, u)
%XU Summary of this function goes here
%   Detailed explanation goes here
output = 0;

u1 = u(1);
u2 = u(2);
u3 = u(3);

if (u1<= -3) || (u1>=3)||(u2<= -3) || (u2>=3)||(u3<= -0.2) || (u3>=0.2) || (D(x, u))
    output = 1;
end
end


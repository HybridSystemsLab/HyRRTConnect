clear all
close all

N = inf;

for k = 1:N
    [t, T, motionplan] = rrt();
    if (~isempty(motionplan)) 
        J = motionplan(2, :);
        if (max(J) > 1)
            pause();
        end
    end
end
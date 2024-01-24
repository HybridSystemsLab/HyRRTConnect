function [I_near] = nearest_neighbor(x, T, flag)
%% flow: flag = 0; jump: flag = 1.
%% Find a nearest neighbor: I_near empty if no nearest neighbor is found.

I_near = [];
iterator = T.depthfirstiterator;

iterator_to_compare = [];
if (flag == 0) %flow
    for i = iterator
        if (Cprime(T.get(i)))
            iterator_to_compare = [iterator_to_compare, i];
        end
    end
elseif (flag == 1) %jump
    for i = iterator
        if (Dprime(T.get(i)))
            iterator_to_compare = [iterator_to_compare, i];
        end
    end
end

if (isempty(iterator_to_compare))
%     disp('No distance is calculated!');
    return;
end
    
N = size(iterator_to_compare, 2);
dist_vector = zeros(1, N);

for i = 1:N
    if (flag == 0)
        dist_vector(i) = dist_flow(T.get(iterator_to_compare(i)), x);
    else
        dist_vector(i) = dist_jump(T.get(iterator_to_compare(i)), x);
    end
end

[Mf, Id] = min(dist_vector);
I_near = iterator_to_compare(Id);

end


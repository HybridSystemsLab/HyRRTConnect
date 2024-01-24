function q = plotcurrentsearchtree(T, edgemap, dir)
iterator = T.depthfirstiterator;
iterator = iterator(2:end);
i = iterator(1);
cur = T.get(i);
parent = T.get(T.getparent(i));
switch dir
    case 0
        label = 'Forward Search Tree';
        color_line = 'k-';
        color_dot = 'k*';
    case 1
        label = 'Backward Search Tree';
        color_line = 'b-';
        color_dot = 'b*';
end

sol = getsolutionpair(edgemap, T.getparent(i), i);
hold on
plot3(cur(1), cur(2), cur(3), color_dot);
plot3(parent(1), parent(2), parent(3), color_dot);
q = plot3(sol(3, :), sol(4, :), sol(5, :), color_line, 'DisplayName', label);
for i = iterator(2:end)
    cur = T.get(i);
    parent = T.get(T.getparent(i));
    plot3(cur(1), cur(2), cur(3), color_dot);
    plot3(parent(1), parent(2), parent(3), color_dot);

    sol = getsolutionpair(edgemap, T.getparent(i), i);
    plot3(sol(3, :), sol(4, :), sol(5, :), color_line, 'DisplayName', label);
end
end

function MP = constructMP_jump(I_fw, T_fw, I_bw, T_bw, edge_map_fw, edge_map_bw, u)
%CONSTRUCTMP Summary of this function goes here
%   Detailed explanation goes here
mp_fw = [];
mp_bw = [];

figure(1)
hold on;
if I_fw ~= 1
    mp_fw = getmotionplan(T_fw, I_fw, edge_map_fw);
    plot3(mp_fw(3, :), mp_fw(4, :), mp_fw(5, :), '-', 'color',[0 0.5 0], 'DisplayName', 'Forward Partial Motion Plan', 'LineWidth', 3);
end
if I_bw ~= 1
    mp_bw = getmotionplan(T_bw, I_bw, edge_map_bw);
    plot3(mp_bw(3, :), mp_bw(4, :), mp_bw(5, :), 'm-', 'DisplayName', 'Backward Partial Motion Plan', 'LineWidth', 3);
end
legend
xlabel('$x_{1}$', 'Interpreter', 'latex');
ylabel('$x_{2}$', 'Interpreter', 'latex');
zlabel('$x_{3}$', 'Interpreter', 'latex');
grid on
box on
set(gca, 'FontSize', 18)

u_m = size(u, 1);

mp_jump_beforejump = [mp_fw(1 : end - u_m, end);
    u];

mp_jump_afterjump = [mp_fw(1, end);
    mp_fw(2, end) + 1;
    mp_bw(3:end, end)];


mp_jump = [mp_jump_beforejump, mp_jump_afterjump];

mp_fw = [mp_fw(:, 1:end - 1), mp_jump];

if I_bw == 1
    MP = mp_fw;
else
    MP = reverseandconcatenate(mp_fw, mp_bw, 1);
end
end


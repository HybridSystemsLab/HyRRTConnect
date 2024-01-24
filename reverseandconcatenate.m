function solution = reverseandconcatenate(solutionfw,solutionbw, u_m)
%REVERSEANDCONCATENATE Summary of this function goes here
%   Detailed explanation goes here

x_m = size(solutionfw, 1) - 2 - u_m;

t_fw = solutionfw(1, :);
j_fw = solutionfw(2, :);
x_fw = solutionfw(3: x_m + 2, :);
u_fw = solutionfw((x_m + 3):end, :);

t_bw = solutionbw(1, :);
j_bw = solutionbw(2, :);
x_bw = solutionbw(3: x_m + 2, :);
u_bw = solutionbw((x_m + 3):end, :);

x0_recon = x_fw(:, end);

t_recon = flip(t_bw(end) - t_bw, 2);
j_recon = flip(j_bw(end) - j_bw, 2);
u_recon = flip(u_bw, 2);

[x_recon] = reconstruct(x0_recon, t_recon, j_recon, u_recon);
figure(1)
hold on
if (x_m > 2)
    plot3(x_recon(1, :), x_recon(2, :), x_recon(3, :), '-', 'color',[0 0 0.5], 'DisplayName', 'Reconstructed Partial Motion Plan', 'LineWidth', 3);
else
    legend('AutoUpdate', 'on');
    plot(x_recon(1, 1:2), x_recon(2, 1:2), '-', 'color',[0 0 0.5],'DisplayName', 'Reconstructed Partial Motion Plan', 'LineWidth', 3);
    legend('AutoUpdate', 'off');
    for i = 1: size(x_recon, 2)-1
        if j_recon(i) == j_recon(i + 1)
            plot(x_recon(1, i:i+1), x_recon(2, i:i+1), '-', 'color',[0 0 0.5], 'LineWidth', 3);
        else
            plot(x_recon(1, i:i+1), x_recon(2, i:i+1), '--', 'color',[0 0 0.5], 'LineWidth', 3);
        end
    end
end
solution_recon = [t_recon + t_fw(end);
    j_recon + j_fw(end);
    x_recon;
    u_recon];

solution = [solutionfw(:, 1: (end - 1)), solution_recon];

% 
% T_val_fw = solutionfw(1, end);
% J_val_fw = solutionfw(2, end);
% 
% T_val_bw = solutionbw(1, end);
% J_val_bw = solutionbw(2, end);
% 
% solutionbw(1,:) = T_val_bw - solutionbw(1,:) + T_val_fw;
% solutionbw(2,:) = J_val_bw - solutionbw(2,:) + J_val_fw;
% 
% solutionbw = flip(solutionbw, 2);
% for i = 1: (size(solutionbw, 2) - 1)
%     if solutionbw(2, i) < solutionbw(2, i + 1)
%         solutionbw((size(solutionbw, 1) - u_m + 1):size(solutionbw, 1), i) = solutionbw((size(solutionbw, 1) - u_m + 1):size(solutionbw, 1), i + 1);
%         solutionbw((size(solutionbw, 1) - u_m + 1):size(solutionbw, 1), i + 1) = zeros(u_m, 1);
%     end
% end

% solution = [solutionfw, solutionbw];

end


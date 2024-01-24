%% store the results
current_time = datestr(datetime('now'));
dir = ['data/success-' loadfilepath current_time];
mkdir(dir);

%% plot initial/final state
figure(1);
hold on
grid on
q1 = plot(x0(1), x0(2),'gs', 'MarkerSize', 10, 'DisplayName','Initial state');
q2 = plot(xf(1), xf(2),'bs', 'MarkerSize', 10, 'DisplayName','Final state');

%% plot search tree
q3 = plotcurrentsearchtree(T_fw, edge_map_fw, 0);
q4 = plotcurrentsearchtree(T_bw, edge_map_bw, 1);

legend([q1 q2 q3 q4], 'fontname','Times New Roman')

%% plot motion plan
% q5 = plot(motionplan(3, 1:2), motionplan(4, 1:2),'r-', 'LineWidth', 2, 'DisplayName','Motion plan');
% 
% for i = 1: (size(motionplan, 2) - 1)
%     if (motionplan(2, i) == motionplan(2, i + 1))
%         plot(motionplan(3, i: i + 1), motionplan(4, i: i + 1),'r-', 'LineWidth', 2);
%     else
%         plot(motionplan(3, i: i + 1), motionplan(4, i: i + 1),'r--', 'LineWidth', 2);
%     end
% end
% legend([q1 q2 q3 q4, q5], 'fontname','Times New Roman')

xlabel('$x_{1}$', 'Interpreter', 'latex');
ylabel('$x_{2}$', 'Interpreter', 'latex');

xlim([-2.5, 30])
ylim([-25, 25])
set(gca,'fontname','Times New Roman','fontsize', 24)
box on
saveas(gcf,[dir '/planfigure.fig']);
save([dir '/data.mat']);
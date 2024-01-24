%% store the results
current_time = datestr(datetime('now'));
dir = ['data/success-' loadfilepath current_time];
mkdir(dir);
save([dir '/data.mat']);

%% plot initial/final state
figure(1);
hold on
grid on
q1 = plot3(x0(1), x0(2), x0(3),'gs', 'MarkerSize', 10, 'DisplayName','Initial state');
q2 = plot3(xf(1), xf(2), xf(3),'ms', 'MarkerSize', 10, 'DisplayName','Final state');
view(37.5, 30) 
%% plot search tree
%% plot search tree
q3 = plotcurrentsearchtree(T_fw, edge_map_fw, 0);
q4 = plotcurrentsearchtree(T_bw, edge_map_bw, 1);

%% plot motion plan
q5 = plot3(motionplan(3, :), motionplan(4, :),motionplan(5, :),'r-', 'LineWidth', 2, 'DisplayName','Motion plan');
legend([q1 q2 q3 q4, q5], 'fontname','Times New Roman', 'Location', 'best')
xlabel('$x_{1}$', 'Interpreter', 'latex');
ylabel('$x_{2}$', 'Interpreter', 'latex');
zlabel('$x_{3}$', 'Interpreter', 'latex');
saveas(gcf,[dir '/planfigure.fig']);

% for i = 1:6
%     figure
%     plot(motionplan(1,:), motionplan(i + 2, :), '-');
%     xlabel('t (seconds)');
%     ylabel('state')
% end
%% 

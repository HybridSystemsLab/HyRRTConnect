close all
figure(2)
grid on
hold on
box on
% axis equal;

xlim([-5, 20]);xlabel('$x_{1}$', 'Interpreter', 'latex');
ylim([-20, 20]);ylabel('$x_{2}$', 'Interpreter', 'latex');

x = [0, 40, 40, 0]; % X-coordinates of the corners of the area
y = [-20, -20, 20, 20]; % Y-coordinates of the corners of the area
q1 = fill(x, y, [0.5, 0.5, 1], 'DisplayName', 'Flow set');

x = [-0.2, 0.2, 0.2, -0.2]; % X-coordinates of the corners of the area
y = [0, 0, -20, -20]; % Y-coordinates of the corners of the area
q2 = fill(x, y, [1, 0.5, 0.5], 'DisplayName', 'Jump set');

q3 = plot(x0(1), x0(2), 'gs','MarkerSize', 10, 'DisplayName', 'Initial state');
q4 = plot(xf(1), xf(2), 'bs','MarkerSize', 10, 'DisplayName', 'Final state');

x = [-1, 40, 40, -1]; % X-coordinates of the corners of the area
y = [-20, -20, 20, 20]; % Y-coordinates of the corners of the area
q1 = fill(x, y, [0.5, 0.5, 1], 'DisplayName', 'Inflated Flow set');

x = [-1, 1, 1, -1]; % X-coordinates of the corners of the area
y = [0, 0, -20, -20]; % Y-coordinates of the corners of the area
q2 = fill(x, y, [1, 0.5, 0.5], 'DisplayName', 'Inflated Jump set');
theta = linspace(0, 2*pi, 100); % Create a vector of 100 points around the circle
radius = 1; % Define the radius of the circle
x_center = 0; % X-coordinate of the circle's center
y_center = 0; % Y-coordinate of the circle's center

x = radius * cos(theta) + x_center; % X-coordinates of the circle's edge
y = radius * sin(theta) + y_center; % Y-coordinates of the circle's edge
fill(x, y, [1, 0.5, 0.5]);

for i = 1:size(motionplan, 2) - 1
    if (motionplan(2, i) == motionplan(2, i + 1))
        q5 = plot([motionplan(3, i), motionplan(3, i + 1)], [motionplan(4, i), motionplan(4, i + 1)], 'Color', [0, 0.5, 0], 'Linewidth', 3, 'DisplayName', 'Motion plan');
    else
        plot([motionplan(3, i), motionplan(3, i + 1)], [motionplan(4, i), motionplan(4, i + 1)], 'Color', [0, 0.5, 0], 'Linewidth', 3);
    end
end
% legend('AutoUpdate', 'on')

legend([q1, q2, q3, q4, q5]);



set(gca, 'Fontsize', 18)

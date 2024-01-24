% model prameters
global xf
InitParams;
xf = [params.phis, -params.phis,0, 0.1, 0.1, 0]';
x0 = g(xf);
global tol
tol = 0.3;

% simulate parameters

global rule;
global options;

rule = 1;
options = odeset('RelTol',1e-6,'MaxStep',.1);

DeltaT = 0.2;
DeltaJ = 1;


global TSPAN_f;
global JSPAN_f;

global TSPAN_g;
global JSPAN_g;

global U_D;
global U_C;
global Tm;
Tm = 0.4;

TSPAN_f=[0 Tm];
JSPAN_f = [0 1];

TSPAN_g=[0 20];
JSPAN_g = [0 1];

U_D = [0; 0; 0];

u_c_1 = [1.9, 1, 0, -1, -1.9]';
u_c_2 = linspace(-2, 2, 5)';
u_c_3 = linspace(-0.15, 0.1, 5)';

U_C = joinmat(joinmat(u_c_1, u_c_2), u_c_3)';

% figure(1);
% plot3(x0(1), x0(2), x0(3),'gs', 'MarkerSize', 10,'DisplayName','Initial State');
% hold on
% plot3(xf(1), xf(2), xf(3),'bs', 'MarkerSize', 10,'DisplayName','Final State');
% hold on
% grid on;





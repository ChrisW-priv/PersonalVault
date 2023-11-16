% clear previous experiment results
clc, clearvars, close all

% initial conditions
tspan = [0 1];
x0 = 530;
y0 = 30;
h = 0.005;
t = linspace(0,1,1/h);

% solution using MATLAB builtin ode45 function
opts = odeset('RelTol',1e-8,'AbsTol',1e-12);
[t_ref,y_ref] = ode45(@equation_given, t, [x0; y0], opts);
% solution using euler explicit method
[t_euler_e,y_euler_e] = euler_explicit(@equation_given, tspan, [x0; y0],h);
% solution using euler implicit method
[t_euler_i,y_euler_i] = euler_implicit(@equation_given, tspan, [x0; y0],h);
% solution using Adams-Moulton method
[t_am,y_am] = Adams_Moulton(@equation_given, tspan, [x0; y0],h);
% solution using Adams-Bashforth method
[t_ab,y_ab] = Adams_Bashforth(@equation_given, tspan, [x0; y0],h);

% plot the results
tiledlayout(2,1)

nexttile
hold on
plot(t_ref, y_ref(:, 1), 'g--');
plot(t_euler_e, y_euler_e(:, 1), 'b-');
plot(t_euler_i, y_euler_i(:, 1), 'k-');
plot(t_am, y_am(:, 1), 'c-');
plot(t_ab, y_ab(:, 1), 'm-');
legend('Ref x', 'explicit Euler x', 'implicit Euler x', 'Adams-Moulton x', 'Adams-Bashforth x');
xlabel('t');
ylabel('x');
hold off

nexttile
hold on
plot(t_ref, y_ref(:, 2), 'g--')
plot(t_euler_e, y_euler_e(:, 2), 'b-')
plot(t_euler_i, y_euler_i(:, 2), 'k-')
plot(t_am, y_am(:, 2), 'c-')
plot(t_ab, y_ab(:, 2), 'm-')

xlabel('t');
ylabel('y');
legend('Ref y', 'explicit Euler y', 'implicit Euler y', 'Adams-Moulton y', 'Adams-Bashforth y');


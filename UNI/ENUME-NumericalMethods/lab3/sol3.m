% clear previous experiment results
clc, clearvars, close all

% initial conditions
tspan = [0 1];
x0 = 530;
y0 = 30;
h = 0.005;
t = linspace(0,1,1/h);

opts = odeset('RelTol',1e-8,'AbsTol',1e-12);
[t_ref,y_ref] = ode45(@equation_given, t, [x0; y0], opts);
[t_euler,y_euler_e] = euler_explicit(@equation_given, tspan, [x0; y0],h);
[t_euler_i,y_euler_i] = euler_implicit(@equation_given, tspan, [x0; y0],h);
[t_am,y_am] = Adams_Moulton(@equation_given, tspan, [x0; y0],h);
[t_ab,y_ab] = Adams_Bashforth(@equation_given, tspan, [x0; y0],h);

Delta_euler_explicit = (sum(y_euler_e(:,2) - y_ref(:,2)).^2) / sum(y_ref(:,2).^2)
Delta_euler_implicit = (sum(y_euler_i(:,2) - y_ref(:,2)).^2) / sum(y_ref(:,2).^2)
Delta_AdamsMoulton = (sum((y_am(:,2) - y_ref(:,2)).^2)) / sum(y_ref(:,2).^2)
Delta_AdamsBashforth = (sum(y_ab(:,2) - y_ref(:,2)).^2) / sum(y_ref(:,2).^2)

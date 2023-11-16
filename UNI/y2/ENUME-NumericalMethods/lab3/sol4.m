% clear previous experiment results
clc, clearvars, close all

% initial conditions
tspan = [0 1];
x0 = 530;
y0 = 30;

hspace = [0.0001, 0.0005, 0.001, 0.0025, 0.005, 0.01];
niter = length(hspace);
err_eu_exp = zeros(niter, 1);
err_eu_imp = zeros(niter, 1);
err_adamou = zeros(niter, 1);
err_adabas = zeros(niter, 1);

for i = 1:niter
    h = hspace(i);
    t = linspace(0,1,1/h);

    opts = odeset('RelTol',1e-8,'AbsTol',1e-12);
    [t_ref,y_ref] = ode45(@equation_given, t, [x0; y0], opts);
    [t_euler,y_euler_e] = euler_explicit(@equation_given, tspan, [x0; y0],h);
    [t_euler_i,y_euler_i] = euler_implicit(@equation_given, tspan, [x0; y0],h);
    [t_am,y_am] = Adams_Moulton(@equation_given, tspan, [x0; y0],h);
    [t_ab,y_ab] = Adams_Bashforth(@equation_given, tspan, [x0; y0],h);

    err_eu_exp(i) = (sum(y_euler_e(:,2) - y_ref(:,2)).^2) / sum(y_ref(:,2).^2);
    err_eu_imp(i) = (sum(y_euler_i(:,2) - y_ref(:,2)).^2) / sum(y_ref(:,2).^2);
    err_adamou(i) = (sum((y_am(:,2) - y_ref(:,2)).^2)) / sum(y_ref(:,2).^2);
    err_adabas(i) = (sum(y_ab(:,2) - y_ref(:,2)).^2) / sum(y_ref(:,2).^2);
end

hold on
plot(hspace, err_eu_exp)
plot(hspace, err_eu_imp)
plot(hspace, err_adamou)
plot(hspace, err_adabas)
set(gca, 'YScale', 'log');
legend('explicit Euler', 'implicit Euler', 'Adams-Moulton', 'Adams-Bashforth');
xlabel("step size")
ylabel("total error")

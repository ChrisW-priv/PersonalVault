% clear previous experiment results
clc, clearvars, close all

data = readmatrix('data38.csv', 'Range', 2);
t = data(:, 1);
x = data(:, 2);
y = data(:, 3);
Y = zeros(length(x),2);
Y(:,1) = x;
Y(:,2) = y;
x0 = 530;
y0 = 30;

% minimize
p_initial = [14, 0.11, 0.04, 10];
objective = @(p) J(t, Y, p);
p_minimized = fminsearch(objective, p_initial)

% solve for minimized p
equation_minimized = @(t, Y) equations(t,Y,p_minimized);
[t_min,y_min] = ode45(equation_minimized, t, [x0; y0]);

% plot the results
tiledlayout(2,1)

nexttile
hold on
plot(t, x);
plot(t, y_min(:,1));
xlabel('t');
ylabel('x');
hold off

nexttile
hold on
plot(t, y)
plot(t_min, y_min(:,2));
xlabel('t');
ylabel('y');


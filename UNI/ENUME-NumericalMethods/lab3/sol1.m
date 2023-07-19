% clear previous experiment results
clc, clearvars, close all

% initial conditions
tspan = [0 1];
x0 = 530;
y0 = 30;

% solution using MATLAB builtin ode45 function
[t,y] = ode45(@equation_given, tspan, [x0; y0]);

% plot the results
plot(t, y(:, 1), 'b-', t, y(:, 2), 'r--');
xlabel('Time');
ylabel('Population');
legend('Prey (x)', 'Predator (y)');


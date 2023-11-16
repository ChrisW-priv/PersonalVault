% clear previous experiment results
clc, clearvars, close all

% define domain and function
x = linspace(0,10,100);
y = @(x) 2.5 * (cos (-x/7 - 1.5)).^3 - 0.01*(x/3).^3 + 2;
range = [0,10];

n_iter_newton1 = zeros(15, 1);
for n = 1:15
    roots_newton1 = newton(y,range(1),10^(-n));
    n_iter_newton1(n) = length(roots_newton1);
end

n_iter_newton2 = zeros(15, 1);
for n = 1:15
    roots_newton2 = newton(y,range(2),10^(-n));
    n_iter_newton2(n) = length(roots_newton2);
end

% plot the consecutive aproximation errors
hold on
plot(1:15, n_iter_newton1, 'LineWidth',1.5);
plot(1:15, n_iter_newton2, 'LineWidth',1.5);
title("Number of iterations depending on the stasting condition");
xlabel("Error size as 10^{-x}"); ylabel("Number of iterations");
legend("x_{min}", "x_{max}");
hold off


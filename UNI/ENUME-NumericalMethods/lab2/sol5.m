% clear previous experiment results
clc, clearvars, close all

% define domain and function
x = linspace(0,10,100);
y = @(x) 2.5 * (cos (-x/7 - 1.5)).^3 - 0.01*(x/3).^3 + 2;
range = [0,10];

n_iter_bisection = zeros(15, 1);
for n = 1:15
    roots_bisection = bisection(y,range,10^(-n));
    n_iter_bisection(n) = length(roots_bisection);
end

n_iter_secant = zeros(15, 1);
for n = 1:15
    roots_secant = secant(y,range,10^(-n));
    n_iter_secant(n) = length(roots_secant);
end

n_iter_newton = zeros(15, 1);
for n = 1:15
    roots_newton = newton(y,range(2),10^(-n));
    n_iter_newton(n) = length(roots_newton);
end

n_iter_muller = zeros(15, 1);
for n = 1:15
    roots_muller = muler2(y,range,10^(-n));
    n_iter_muller(n) = length(roots_muller);
end

% plot the consecutive aproximation errors
hold on
plot(1:15, n_iter_bisection, 'LineWidth',1.5);
plot(1:15, n_iter_secant, 'LineWidth',1.5);
plot(1:15, n_iter_newton, 'LineWidth',1.5);
plot(1:15, n_iter_muller, 'LineWidth',1.5);
title("Number of iterations for each error size");
xlabel("Error size as 10^{-x}"); ylabel("Number of iterations");
legend("Bisection", "Secant", "Newton", "Muler2");
hold off


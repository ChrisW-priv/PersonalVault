% clear previous experiment results
clc, clearvars, close all

% define domain and function
x = linspace(0,10,100);
y = @(x) 2.5 * (cos (-x/7 - 1.5)).^3 - 0.01*(x/3).^3 + 2;
range = [0,10];

foo = @(n) log2(10./(10.^(-n)));
theoretical = feval(foo, 1:15);

n_iter_bisection = zeros(15, 1);
for n = 1:15
    roots_bisection = bisection(y,range,10^(-n));
    n_iter_bisection(n) = length(roots_bisection);
end

% plot the consecutive aproximation errors
hold on
plot(1:15, n_iter_bisection, 'LineWidth',1.5);
plot(1:15, theoretical, 'LineWidth',1.5);
title("Number of iterations for each error size");
xlabel("Error size as 10^{-x}"); ylabel("Number of iterations");
legend("True number", "Theoretical value");
hold off


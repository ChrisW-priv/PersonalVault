% clear previous experiment results
clc, clearvars, close all

% define domain and function
x = linspace(0,10,100);
y = @(x) 2.5 * (cos (-x/7 - 1.5)).^3 - 0.01*(x/3).^3 + 2;
range = [0,10];

ref_xzero = fzero(y, range);
our_xzerob = bisection(y,range,1.0e-12);
our_xzeros = secant(y,range,1.0e-12);
our_xzeron = newton(y,10,1.0e-12);
our_xzerom = muler2(y,range,1.0e-12);
errorb = abs(our_xzerob - ref_xzero);
errors = abs(our_xzeros - ref_xzero);
errorn = abs(our_xzeron - ref_xzero);
errorm = abs(our_xzerom - ref_xzero);

% plot the consecutive aproximation errors
hold on
semilogy(1:length(errorb), errorb);
semilogy(1:length(errors), errors);
semilogy(1:length(errorn), errorn);
semilogy(1:length(errorm), errorm);
title("Comparison of error reduction using different methods");
xlabel("Iteration step"); ylabel("Absolute error");
legend("Bisection", "Secant", "Newton", "Muler2");
set(gca, 'YScale', 'log');
hold off


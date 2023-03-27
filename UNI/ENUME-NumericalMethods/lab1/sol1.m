% clear previous experiment results
clc, clearvars, close all

% define domain and function
x = linspace(0,3,100);
y = @(x) cos(x)./x.^3 + x.^2;
% define erronous domain
esim = 1.0e-8;
x_eps = x.*(1+esim);
% calculate true y and epsilon y
ydot = y(x);
yeps = y(x_eps);
% calculate T numerically
numerator = yeps - ydot;
abs_error = abs(numerator ./ ydot);
tx = 1/esim * abs_error;

% calculate T analiticaly (formula calculated in the report)
T1 = -sin(x)./(x.^2);
T2 = -3*cos(x)./(x.^3);
T3 = -cos(x)./(x.^3);
T4 = x.^2;

analitical = (abs(T1) + abs(T2) + abs(T3) + abs(T4))./ydot;
tx_analitical = analitical;

% plot results to validate both methods result in simmilar results
semilogy(x,tx, '*');
hold on 
semilogy(x,tx_analitical, '*');
title("Plot of T(x)"), xlabel("x"), ylabel("y = T(x)"), legend("Numerical", "Analitical")

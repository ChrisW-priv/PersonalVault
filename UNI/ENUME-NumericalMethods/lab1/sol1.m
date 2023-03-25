clc, clearvars, close all

x = linspace(0,3,100);
esim = 1.0e-8;
x_eps = x.*(1+esim);
y = @(x) cos(x)./x.^3 + x.^2;
ydot = y(x);
yeps = y(x_eps);
tx = 1/esim * abs((yeps - ydot) ./ ydot);
tx_analitical = (abs(-sin(x) ./ x.^2) + abs(-3*cos(x)./x.^3) + abs(2*x.^2));

semilogy(x,tx, '*');
hold on 
semilogy(x,tx_analitical, '*');
legend()

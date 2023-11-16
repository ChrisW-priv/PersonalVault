% clear previous experiment results
clc, clearvars, close all

% define domain and function
x = linspace(0,10,100);
y = @(x) 2.5 * (cos (-x/7 - 1.5)).^3 - 0.01*(x/3).^3 + 2;
range = [0,10];
ref_xzero = fzero(y, range);
our_xzero = bisection(y,range,1.0e-12);
error = abs(our_xzero - ref_xzero);

% plot the consecutive aproximation errors
semilogy(1:length(error), error);


% clear previous experiment results
clc, clearvars, close all

% define domain and function
x = linspace(0,10,100);
y = @(x) 2.5 * (cos (-x/7 - 1.5)).^3 - 0.01*(x/3).^3 + 2;
format long
xzero = fzero(y, [0,10])

hold on
% plot the function
plot(x, y(x));
% plot line y=0
line(xlim(), [0,0], 'Color', 'k');
% add the intersection point
plot(xzero, 0, 'o')
hold off


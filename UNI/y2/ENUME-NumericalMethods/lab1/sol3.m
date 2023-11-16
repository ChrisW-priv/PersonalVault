% clear previous experiment results
clc, clearvars, close all;

% define domain and function
x = linspace(0,3,100);
y = cos(x)./x.^3 - x.^2;
eta = 1.0e-08;

% calculate T numerically
T1 = abs((cos(x) ./ x.^3)./y);
T2 = abs((-1* x.^2)./y);
T3 = abs(((cos(x) - x.^5) ./ x.^3)./y);

% calculate T analiticaly (formula calculated in the report)
tx_analitical = T1 + T2 + 3*T3;

% begin of numerical calculations
tx_numerical = zeros(1, 100);

% create a function that creates a vector of random values: -1 or 1
rand_sign_vec = @() (randi(2,1,5)-1.5)*2;
for i = 1:300
    en = eta * rand_sign_vec();
    v1 = T1 * (1+en(1));
    v2 = T2 * (1+en(2));
    v3 = T3 * (1+en(3));
    v4 = T3 * (1+en(4));
    v5 = T3 * (1+en(5));
    ytilde = v1+v2+v3+v4+v5;
    tx_numerical = max(tx_numerical, ytilde);
end

% plot results to validate both methods result in simmilar results
semilogy(x,tx_numerical, '*');
hold on 
semilogy(x,tx_analitical, '*');
title("Plot of K_{a2}(x)"), xlabel("x"), ylabel("y = K_{a2}(x)"),
legend("Numerical", "Analitical")

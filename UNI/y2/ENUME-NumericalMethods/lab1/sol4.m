x = linspace(0,3,100);
y = @(x) cos(x)./x.^3 - x.^2;
esim = 1.0e-8;
xeps = x.*(1+esim);
ydot = y(x);

yeps = y(xeps);
numerator = yeps - ydot;
abs_error = abs(numerator ./ ydot);
tx_numerical = 1/esim * abs_error;
semilogy(x,tx_numerical, '*');
hold on

T1 = abs((cos(x) ./ x.^3)./ydot);
T2 = abs((-1* x.^2)./ydot);
tx_numerical = 3*T1 + T2 + 1;
semilogy(x,tx_numerical, '*');
hold on

T1 = abs((cos(x) ./ x.^3)./ydot);
T2 = abs((-1* x.^2)./ydot);
T3 = abs(((cos(x) - x.^5) ./ x.^3)./ydot);
tx_numerical = T1 + T2 + 3*T3;
semilogy(x,tx_numerical, '*');

title("Comparison of T_x, K_{a1} and K_{a2}"), xlabel("x"),
ylabel("y = Funtion(x)"), legend("T_x", "K_{a1}", "K_{a2}")

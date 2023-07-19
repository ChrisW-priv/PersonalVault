function dydt = equation_given(t,y)
    dx = 14 * y(1) - 0.11 * y(1)*y(2);
    dy = 0.04 * y(1)*y(2) - 10 * y(2);
    dydt = [dx; dy];
end


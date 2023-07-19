function dydt = equations(t,y,p)
    dx = p(1) * y(1) - p(3) * y(1)*y(2);
    dy = p(3) * y(1)*y(2) - p(4) * y(2);
    dydt = [dx; dy];
end

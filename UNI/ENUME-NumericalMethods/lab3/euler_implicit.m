function [t y] = euler_implicit(f,tspan,initial_state,h)
    N = (tspan(2) - tspan(1)) / h;
    t = zeros(N, 1);
    y = zeros(N, 2);
    t(1) = tspan(1);
    y(1, :) = initial_state;
    for n = 2:N
        for i = 1:5
            y(n, :) = y(n-1,:) + f(t(n), y(n, :))'*h;
        end
        t(n) = t(n-1) + h; 
    end
end


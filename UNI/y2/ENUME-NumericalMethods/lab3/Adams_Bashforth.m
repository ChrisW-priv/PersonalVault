function [t y] = Adams_Bashforth(f,tspan,initial_state,h)
    N = (tspan(2) - tspan(1)) / h;
    t = zeros(N, 1);
    y = zeros(N, 2);
    t(1) = tspan(1);
    y(1, :) = initial_state;
    for n = 2:N
        t(n) = t(n-1) + h; 
        y(n, :) = y(n-1,:);
        y(n,:) = y(n,:) + h*23/12*f(t(n-1), y(n-1,:))';
        if n > 2
            y(n,:) = y(n,:) - h*16/12*f(t(n-2), y(n-2,:))';
        if n > 3
            y(n,:) = y(n,:) + h*5/12*f(t(n-3), y(n-3,:))';
        end
    end
end


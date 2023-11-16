function [t y] = Adams_Moulton(f,tspan,initial_state,h)
    N = (tspan(2) - tspan(1)) / h;
    t = zeros(N, 1);
    y = zeros(N, 2);
    t(1) = tspan(1);
    y(1, :) = initial_state;
    for n = 2:N
        y(n, :) = y(n-1,:);
        for k = 0:1
            y(n,:) = y(n,:) + h*0.5*f(t(n-k), y(n-k,:))';
        end
        t(n) = t(n-1) + h; 
    end
end

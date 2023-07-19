function error = J(t,y,p)
    % Solve the system of equations using ode45
    [~, sol] = ode45(@(t, y) equations(t, y, p), t, [530, 30]);

    % Extract the estimated x and y values
    x_est = sol(:, 1);
    y_est = sol(:, 2);

    % Compute the squared error
    error = sum((x_est - y(1)).^2) + sum((y_est - y(2)).^2);
end


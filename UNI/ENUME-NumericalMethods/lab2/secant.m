function result = secant(f, x, xeps)
    result = x;
    i = 2;
    while abs(result(i)-result(i-1)) > xeps
        xi = result(i);
        xi1 = result(i-1);
        fx = f(xi);
        fx1 = f(xi1);
        result(i+1) = xi - (xi-xi1)/(fx-fx1)*fx;

        i = i + 1;
    end 
end

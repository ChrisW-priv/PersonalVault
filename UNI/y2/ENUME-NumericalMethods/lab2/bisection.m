function result = bisection(f, x, xeps)
    a=x(1); b=x(2);
    i = 1;
    while abs(0.5*(a-b)) > xeps
        result(i) = 0.5 * (a+b);
        if (f(a) * f(result(i)) < 0)
            b = result(i);
        else
            a = result(i);
        end
        i = i + 1;
    end 
end

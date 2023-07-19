function result = newton(f, x, xeps)
    fdx = @(x) 1/eps* imag(f(x + 1i*eps));

    result(1) = x;
    i = 1;
    while 1
        xi = result(i);
        fx = f(xi);
        fxdelta = fdx(xi);
        result(i+1) = xi - fx/fxdelta;
        i = i + 1;
        if abs(result(i)-result(i-1)) < xeps, break; end
    end 
end

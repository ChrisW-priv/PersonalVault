function result = muler2(f, x, xeps)
    result(1) = x(1); result(2) = mean(x); result(3) = x(2);
    i = 3;
    while abs(result(i)-result(i-1)) > xeps
        matrix = [
            -(result(i)-result(i-1))^2 (result(i)-result(i-1));
            -(result(i)-result(i-2))^2 (result(i)-result(i-2));
            ];
        vec = [
            f(result(i))-f(result(i-1))
            f(result(i))-f(result(i-2))
            ];
        foo = matrix\vec;
        ai = foo(1); bi = foo(2);
        ci = f(result(i));
        result(i+1) = result(i) - 2*ci/(bi + sign(bi)*sqrt(bi^2 + 4*ai*ci));
        i = i + 1;
    end 
end

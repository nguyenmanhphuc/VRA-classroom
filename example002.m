function example002()
    message = '\nNhap m: ';
    m = input(message);
    message= '\nNhap n: ';
    n = input(message);
    a = ones(m, n);
    b = zeros(m, n);
    c = eye (m, n);
    d = randi([-10 10], m, n);
    a (1, 1) = 5;
    e =size(a);
end


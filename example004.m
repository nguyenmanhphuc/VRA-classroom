function example004()
    message = '\nNhap n: ';
    n = input(message);
    s = 0;
    for i = 1:n
        s = s + i;
    end
    fprintf('\nTong S = 1 + 2 + 3 + ... + %d la: %d\n',n, s);
end


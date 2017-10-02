function res = is_prime(n)
    if(n < 2)
        res = 0;
        return;
    end
    limit = round(sqrt(n));
    for i = 2:limit
        if(mod(n, i)==0)
            res = 0;
            return;
        end
    end
    res = 1;
end


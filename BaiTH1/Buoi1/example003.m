function example003(  )
 message = '\nNhap n: ';
 n = input(message);
 s = 0;
 i = 1;
 while(i<=n)
     s = s+ i;
     i = i +1;
 end
 fprintf('\n Tong S = 1 + 2 + 3 + ... + %d: %d,\n',n, s);
end


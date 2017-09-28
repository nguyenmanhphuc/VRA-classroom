function example001()
a = rand();
fprintf('\n....:[%8.3f]', a);
r = randi([1 10]);
fprintf('\n...[1 10]: [%d]', r);

rArray =randi([-10 10], 1, 10);
fprintf('\n...: [%d].', size(rArray, 2));
fprintf('\nMang duoc tao la:');
fprintf('[%3d]', rArray);
fprintf('\n');
end


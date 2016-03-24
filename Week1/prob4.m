% Week 1 Problem 4
% Show accuracy difference between Fixed-point iteration & Newton-Raphson
% iteration
% cheng yu ge
% 12307110079

G = @(x)exp(-x);
F = @(x)x-exp(-x);
F1 = @(x)1+exp(-x);
NRI = @(x)x - F(x)/F1(x);
x1 = zeros(1,30); x2 = x1;
x1(1) = 1; x2(1) = 1;
for i = 2:30
    x1(i) = G(x1(i-1));
    x2(i) = NRI(x2(i-1));
end
xe = x2(30);
fprintf('\n n &  FPx_n   &  FPrel  &  FPerr  &  NRx_n   &  NRrel  &  NRerr  \\\\\n');
for i = 2:30
    fprintf('%2d & %.6f & %.1e & %.1e & %.6f & %.1e & %.1e \\\\\n', ...
        i-1, x1(i), abs((x1(i)-x1(i-1))/x1(i)), abs((x1(i)-xe)/xe), ...
        x2(i), abs((x2(i)-x2(i-1))/x2(i)), abs((x2(i)-xe)/xe));
end
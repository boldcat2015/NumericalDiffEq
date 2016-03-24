% Week 1 Problem 1
% show lim(x->0) (1-cos(x))/x^2
% cheng yu ge
% 12307110079

x = linspace(0,0.01,10e4);
y = abs((1-cos(x)) ./ (x.^2) - 0.5);
loglog(x, y);
h = legend('y = abs((1-cos(x)) / x^2 - 0.5)','Location', 'North');
set(h,'Fontsize', 22);
set(gca,'Fontsize', 16);
% Week 2 Problem 1
% Runge's Phenomenon
% cheng yu ge
% 12307110079

% The function
f = @( x ) ones( size(x) ) ./ ( 1 + 25 * x .^ 2 ) ;

% Plotting Parameters
xx = -1 :.001:1 ;

figure ;
hold on ;
plot( xx, f( xx ), 'k-', 'Linewidth', 2 ) ;

% polinomial interpolation on Equidistant Nodes
n = 2 * [ 2, 4, 6 ] + 1 ;
linsty = { '--', '-.', ':' } ;
for i = 1 : 3
    x = linspace( -1, 1, n( i ) ) ;
    y = f(x) ;
    [ p, s ] = polyfit( x, y, n(i) - 1 ) ;
    plot( xx, polyval( p, xx, s ), strcat( 'b', linsty{ i } ), 'Linewidth', 1.5 ) ;
end

% polinomial interpolation on Chebyshev Extreme Points
x = -cos( (0 : 12) * pi ./ 12) ;
y = f(x) ;
[ p, s ] = polyfit( x, y, 12 ) ;
plot( xx, polyval( p, xx, s ), 'r-', 'Linewidth', 1 ) ;

h = legend( 'f(x)', 'EqDist n = 4', 'EqDist n = 8', 'EqDist n = 12', 'Chebyshev n = 12', 'Location', 'South' ) ;
axis( [ -1, 1, -2.5, 1.5 ]) ;
set(h,'Fontsize', 22);
set(gca,'Fontsize', 16);

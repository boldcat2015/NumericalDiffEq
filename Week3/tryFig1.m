% P67 / Fig 2.1
% du/dt = u - u^2

f = @(t,u) u - u .^ 2 ;
u = @(t, u0) 1 ./ ( ( 1 / u0  - 1 ) * exp( -t ) + 1 );
tt = linspace ( 0 , 8 , 1e5 );
uu = u( tt , 0.5 );
figure ;
hold on ;
plot( tt , uu , 'k-' );

dt = 8 / 50 ;
[ttt , uuu] = ExplicitEulerScheme ( f , 0.5 , 0 , dt , 8 );
plot( ttt , uuu , 'o' );
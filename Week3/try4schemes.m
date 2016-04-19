%% Definitions of 
explc = @(dt, un) un * ( 1 - 2*dt ) ;
implc = @(dt, un) un * ( 1 - 2*dt / (1 + 2*dt) ) ;
imprv = @(dt, un) un * ( 1 - 2*dt / (1 + dt) ) ;
modfy = @(dt, un) un * ( 1 - 2*dt - 2*dt^2 ) ;
exact = @( t ) exp ( -2 .* t ) ;
t0 = 0 ; T = 8 ; u0 = 1 ;

%% Plot error-step ( % smaller scale)
step = 0.1 : 0.02 : 1 ;
% step = 0.1 .^ ( 1 : 6 ) ;
m = length ( step );
er1 = zeros ( 1 , m ) ;
er2 = zeros ( 1 , m ) ;
er3 = zeros ( 1 , m ) ;
er4 = zeros ( 1 , m ) ;
for j = 1 : m
    dt = step(j) ;
    tt = ( t0 : dt : T ) ;
    n = length ( tt ) ;
    u1 = zeros ( 1 , n ) ; u1( 1 ) = 1 ;
    u2 = zeros ( 1 , n ) ; u2( 1 ) = 1 ;
    u3 = zeros ( 1 , n ) ; u3( 1 ) = 1 ;
    u4 = zeros ( 1 , n ) ; u4( 1 ) = 1 ;
    for i = 1 : n - 1
        u1(i + 1) = explc( dt , u1(i) ) ;
        u2(i + 1) = implc( dt , u2(i) ) ;
        u3(i + 1) = imprv( dt , u3(i) ) ;
        u4(i + 1) = modfy( dt , u4(i) ) ;
    end
    U = feval(exact, tt);
    er1(j) = max(abs(u1 - U));
    er2(j) = max(abs(u2 - U));
    er3(j) = max(abs(u3 - U));
    er4(j) = max(abs(u4 - U));
end
semilogy ( step , er1 , 'ko' ) ; hold on ;
semilogy ( step , er2 , 'b>' ) ;
semilogy ( step , er3 , 'ms' ) ;
semilogy ( step , er4 , 'rd' ) ; 
% loglog ( step , er1 , 'ko' ) ; hold on ;
% loglog ( step , er2 , 'b>' ) ;
% loglog ( step , er3 , 'ms' ) ;
% loglog ( step , er4 , 'rd' ) ; 
h = legend('explicit','implicit','improved','modified');
set(h,'Fontsize',28);

%% Plot exact & 4 schemes

t = linspace ( t0 , T , 1e4 ) ;
u = exact ( t ) ;
figure ( 2 );
hold on ;
plot ( t , u , 'k-' ) ;

dt = 0.6 ; % 0.3 , 0.6 , 0.9
tt = ( t0 : dt : T ) ;
n = length ( tt ) ;
u1 = zeros ( 1 , n ) ; u1( 1 ) = 1 ;
u2 = zeros ( 1 , n ) ; u2( 1 ) = 1 ;
u3 = zeros ( 1 , n ) ; u3( 1 ) = 1 ;
u4 = zeros ( 1 , n ) ; u4( 1 ) = 1 ;
for i = 1 : n - 1
    u1(i + 1) = explc( dt , u1(i) ) ;
    u2(i + 1) = implc( dt , u2(i) ) ;
    u3(i + 1) = imprv( dt , u3(i) ) ;
    u4(i + 1) = modfy( dt , u4(i) ) ;
end
plot ( tt , u1 , 'ko' ) ;
plot ( tt , u2 , 'b>' ) ;
plot ( tt , u3 , 'ms' ) ;
plot ( tt , u4 , 'rd' ) ; 
h = legend('exact','explicit','implicit','improved','modified');
set(h,'Fontsize',22);
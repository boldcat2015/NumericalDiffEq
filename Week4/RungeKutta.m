%% definitions
f = @(u) u - u .^ 2 ;
u = @(t, u0) 1 ./ ( ( 1 / u0  - 1 ) * exp( -t ) + 1 );
phi2 = @(u, dt) 1/2 *( f(u) + f(u + dt * f(u)) );
phi3 = @(u, dt) 1/6 *( f(u) + 4 * f(u + dt/2 * f(u)) ...
    + f(u + dt *(-f(u) + 2* f(u + dt/2 * f(u)))) );
phi4 = @(u, dt) 1/8 *( f(u) + 3 * f(u + dt/3 * f(u)) ...
    + 3 * f(u + dt *(-1/3 * f(u) + f(u + dt/3 * f(u)))) ...
    + f(u + dt *(f(u) - f(u + dt/3 * f(u)) ...
     + f(u + dt *(-1/3 * f(u) + f(u + dt/3 * f(u)))))) );
t0 = 0 ; T = 8 ;
u0 = 0.5 ; % u0 = 1.5

%% compute error of Explicit Euler, phi2, phi3, phi4
r = 13;
dts = 2 .^ -(1: r);
e1 = zeros(1, r);
e2 = zeros(1, r);
e3 = zeros(1, r);
e4 = zeros(1, r);
for i = 1 : r
    dt = dts(i);
    tdt = t0 : dt : T ;
    n = length(tdt);
    uu = u( tdt , u0 );
    u1 = zeros ( 1 , n );
    u2 = zeros ( 1 , n );
    u3 = zeros ( 1 , n );
    u4 = zeros ( 1 , n );
    u1(1) = u0 ; u2(1) = u0 ; u3(1) = u0 ; u4(1) = u0 ;
    for j = 1 : n - 1
        u1(j + 1) = u1(j) + dt * f(u1(j));
        u2(j + 1) = u2(j) + dt * phi2(u2(j), dt);
        u3(j + 1) = u3(j) + dt * phi3(u3(j), dt);
        u4(j + 1) = u4(j) + dt * phi4(u4(j), dt);
    end
    e1(i) = max(abs(u1 - uu));
    e2(i) = max(abs(u2 - uu));
    e3(i) = max(abs(u3 - uu));
    e4(i) = max(abs(u4 - uu));
end

%% plot
semilogy((1: r), e1, '-+'); hold on; grid on;
semilogy((1: r), e2, '-d');
semilogy((1: r), e3, '-*');
semilogy((1: r), e4, '-o');
semilogy((1: r), dts);
semilogy((1: r), dts .^ 2);
semilogy((1: r), dts .^ 3);
semilogy((1: r), dts .^ 4);
set(gca,'ytick', 10 .^ (-15 : 2 : -1));
title('Error of Kutta 1, 2, 3, 4');
h = legend('Explicit Euler', 'Kutta-2', 'Kutta-3', 'Kutta-4', ...
    '\Delta t^1', '\Delta t^2', '\Delta t^3', '\Delta t^4');
xlabel('i:\Delta t=2^{-i}', 'Fontsize', 14);
set(h, 'Fontsize', 16);

%% verify degree of convergence
figure(2);
for i = 1 : 4
    d1 = e1 ./ (dts .^ i);
    d2 = e2 ./ (dts .^ i);
    d3 = e3 ./ (dts .^ i);
    d4 = e4 ./ (dts .^ i);
    subplot(2,2,i);
    semilogy((1: r), d1); hold on;
    semilogy((1: r), d2);
    semilogy((1: r), d3);
    semilogy((1: r), d4);
    legend('Explicit Euler', 'Kutta-2', 'Kutta-3', 'Kutta-4');
    title(sprintf('p=%d', i));
end
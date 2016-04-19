function [ t , u ] = ExplicitEulerScheme( f , u0 , t0 , dt , T )
%EXPLICITEULERSCHEME u_n+1 = u_n + dt * f_n
%   input : f , u0 , t0 , dt , T .
%           f : du/dt , the derivitive
%           u0: start value
%           t0: start time
%           dt: step length
%           T : end time
%   output: t , u
%   You can use plot ( t , u ) :)

if nargin < 1
    f = @(t,u) -1/2 .* u ;
    warning('f(t,u) = -2u , by default.');
end
if nargin < 2
    u0 = 1 ;
    warning('u0 set to 1 by default.');
end
if nargin < 3
    t0 = 0 ;
    warning('t0 set to 0 by default.');
end
if nargin < 4
    dt = 1 ;
    warning('dt set to 1 by default.');
end
if nargin < 5
    T = t0 + 50 * dt ;
    warning('T set to t0 + 50 * dt by default.');
end
t = (t0 : dt : T);
n = length(t);
u = zeros ( 1 , n );
u(1) = u0 ;
for i = 1 : n - 1
    u(i + 1) = u(i) + dt * f(t(i),u(i));
end
end


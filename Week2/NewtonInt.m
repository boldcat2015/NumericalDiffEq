% Week 2 Problem 2
% Compute Integral of x^n [0,1] by Newton Formula
% cheng yu ge
% 12307110079

% Newton Integral Formuae where n = 0, 1, 2, 3, 4
Midpoint = @(f,a,b) (b - a) * f( (a + b) ./ 2 ) ;
Trapezoidal = @(f,a,b) (b - a)/2 * (f(a) + f(b)) ;
Simpson = @(f,a,b) (b - a)/6 * ( f(a) + 4*f( (a + b) ./ 2 ) + f(b) ) ;
Rule38 = @(f,a,b) (b - a)/8 * ( f(a) + 3*f( (2*a + b) ./ 3 ) ... 
    + 3*f( (a + 2*b) ./ 3 ) + f(b) ) ;
Cotes = @(f,a,b) (b - a)/90 * ( 7*f(a) + 32*f( (3*a + b) ./ 4 ) ... 
    + 12*f( (a + b) ./ 2 ) + 32*f( (a + 3*b) ./ 4 ) + 7*f(b) ) ;

% show table 1.4 on P43
E = (1 : 7) ;
F = @(x) x .^ E ;
Exact = 1 ./ (E + 1) ;
T = horzcat  (   Exact' , ... 
    Midpoint   (F,0,1)' , ...
    Trapezoidal(F,0,1)' , ...
    Simpson    (F,0,1)' , ...
    Rule38     (F,0,1)' , ...
    Cotes      (F,0,1)' ) ;
disp(T);

% show error
figure ; 
hold on ;
for i = 2 : 6
    plot ( E , abs(T(:,i)' - T(:,1)') );
end
h = legend('Midpoint','Trapezoidal','Simpson','Rule3/8','Cotes');
set(h,'Fontsize',22);
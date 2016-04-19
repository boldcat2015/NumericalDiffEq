% Week 2 Problem 3
% Compute Integral of x^n [0,1] by Gauss Formula
% cheng yu ge
% 12307110079

% show table 1.5 on P49
E = (1 : 7);
Exact = 1 ./ (E + 1) ;
T = zeros(7,5);
for i = E
    for j = 1 : 5
        T(i,j) = GaussInt( @(x) x .^ i , j , 0 , 1 );
    end
end
disp( horzcat( Exact' , T ) );

% show error
figure ;
hold on ;
for i = 1 : 5
    plot ( E , abs(T(:,i)' - Exact) );
end
h = legend('1 point','2 points','3 points','4 points','5 points')
axis([1,7,-0.01,0.14]);
set(h,'Fontsize',22);
title('error of 1-5 point(s) Gauss integral formula');

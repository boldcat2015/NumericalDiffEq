function [ G ] = GaussInt( f , n , a , b )
%GAUSSINT : Integral of f over [a,b] by n point Gauss Integral Formula
%   input : f , n , a , b .
%           f : function ,
%           n : number of nodes ,
%           a , b : interval [ a , b ] .
%   output: G : Gauss Integral

% validating input
if nargin < 2
    n = 4 ;
    warning('n set to 4 by default.');
end
if nargin < 3
    a = -1 ;
    warning('a set to -1 by default.');
end
if nargin < 4
    b = a + 2 ;
    warning('b set to a + 2 by default.');
end

[ x , w ] = LegendreGauss ( n - 1 );
G = (b-a)/2 * w * f( (b-a)/2 .* x + (b+a)/2 ) ;
end
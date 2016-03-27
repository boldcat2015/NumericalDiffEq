function [ x , w ] = LegendreGauss( n )
%LEGENDREGAUSS returns Nodes and Weight of Gauss Integral Formula
%   input : n , the number of Nodes
%   output: [ x , w ] , Nodes and their Weight
%   NOTE : the integral interval is [ -1 , 1 ] by default,
%          a linear transformation is needed to [ a , b ].

b = 0.5 ./ sqrt( 1 - (2*(1:n)) .^ (-2) );
[ V , Lambda ] = eig( diag(b,1) + diag(b,-1) );
[ x , i ] = sort( diag(Lambda) );
w = 2 * V(1, i) .^ 2 ;
end


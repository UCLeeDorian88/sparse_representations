function [ x ] = soft_thresh(b, lambda)
% Function to solve soft thresholding problem
%
% arg min_{x} 0.5 * ||x - b||_{2}^{2} + lambda*||x||_{1}
%
% Usage:- x = soft_thresh_cvx
%
% where:- <in>
%         b = bias vector
%         lambda = weighting on the l1 penalty
%         <out>
%         x = solution          
%

x = sign(b).*max( abs(b) - lambda, 0 );

end


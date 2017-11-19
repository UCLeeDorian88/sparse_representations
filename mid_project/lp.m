function [x, estimated_supp] = lp(A, b, tol)
% LP Solve Basis Pursuit via linear programing
%
% Solves the following problem:
%   min_x || x ||_1 s.t. b = Ax
%
% The solution is returned in the vector x.


% Set the options to be used by the linprog solver
options = optimoptions('linprog','Algorithm','dual-simplex',...
    'Display','none','OptimalityTolerance',tol);

% TODO: Use Matlab's linprog function to solve the BP problem
% Write your code here... x = ????;
estimated_supp = [];

n  = size(A,1);
m  = size(A,2);
x  = zeros(m,1);

f = ones( 2 * m, 1 );

x0 = linprog(f, [A, -A], b, [A, -A], b , zeros(2*m,1), 100000 * ones(2*m,1), 50000, options);

estimated_supp = [];

for i=1:m
   x(i) =  x0(i) - x0(i + m);
end

for i=1:m
    if ( x(i) ~= 0 )
        estimated_supp = [estimated_supp i];    
    end
end
end

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
estimated_supp = [0];

[n, m] = size(A); 
f = [zeros(m, 1); ones(m, 1)];

Ai = [-eye(m), -eye(m); eye(m), -eye(m)];
bi = zeros(2*m, 1);
x = linprog(f, Ai, bi, [A, zeros(n, m)], b);
x = x(1:m);

estimated_supp = [];

for i=1:m
    if ( x(i) ~= 0 )
        estimated_supp = [estimated_supp i]    
    end
end

end

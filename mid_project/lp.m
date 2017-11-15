function x = lp(A, b, tol)
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


end

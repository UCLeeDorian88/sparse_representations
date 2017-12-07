function x = omp(A, b, k)
% OMP Solve the P0 problem via OMP
%
% Solves the following problem:
%   min_x ||b - Ax||_2^2 s.t. ||x||_0 <= k
%
% The solution is returned in the vector x

% Initialize the vector x
x = zeros(size(A,2),1);
r = b;
S = [];

for i=1:k
    % Choosing next atom:
    corr   = abs(A'*r);
    [~,id] = max(corr);
    S      = [S id];
    
    % Coefficient valus via LS:
    As = A(:,S);
    xs = pinv(As)*b;
    x(S) = xs;
    
    % Residual update:
    r = b-A*x;
    
    if norm(r)<1e-8
        break;
    end
end


end


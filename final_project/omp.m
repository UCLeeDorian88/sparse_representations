function x = omp(CA, b, k)
% OMP Solve the sparse coding problem via OMP
%
% Solves the following problem:
%   min_x ||b - CAx||_2^2 s.t. ||x||_0 <= k
%
% The solution is returned in the vector x

% Initialize the vector x
x = zeros(size(CA,2),1);

% TODO: Implement the OMP algorithm
% Write your code here... x = ????;




end


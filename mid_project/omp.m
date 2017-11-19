function [x, estimated_supp] = omp(A, b, max_k)
% OMP Solve the P0 problem via OMP
%
% Solves the following problem:
%   min_x ||b - Ax||_2^2 s.t. ||x||_0 <= max_k
%
% The solution is returned in the vector x

% Initialize the vector x
m  = size(A,1);
n  = size(A,2);

x    = zeros(n,1);
r    = b;
supp = [];
k    = 0;

%iteration
while ( k <= max_k )

    k = k+1;
    
    %compute e(i0) and i0
    e_i0 = 0;
    i0 = 1;
    for i = 1:m
        ai = A(:,i);
        v = abs( dot(ai'*r));
        if ( v > e_i0)
            i0  = i;
            e_i0 = v;
        end
    end
   
    %add i0 to the support
    %sort the columns so we do not change the basis elements
    %may be not needed
    supp = sort( [supp i0] );
    
    %preallocation of the columns
    As = zeroes( n, size(supp, 2) );

    %form As
    for i = 1:size( supp, 2 )
        As(:,i) = A(:,supp(i));
    end
    
    %solve the least squares problem
    xk = lsqminnorm(As,b);

    x  = zeros(n,1);

    %put the values back into the solution
    for i = 1:size( supp, 2 )
        x( supp(i) ) = xk(i); 
    end
    
    %update the residual
    r = b - A*x;
    
    %bail out if we are very close
    n_r = norm(r);
    if ( n_r < 0.001)
        break;
    end
end

estimated_supp = supp;


end


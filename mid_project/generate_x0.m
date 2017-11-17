function [x0, indices] = generate_x0(dimension, cardinality, min_bounds, max_bounds)
%Generate a sparse vector of cardinality. 
%Draw at random the  locations of the non-zero entries (using Matlab's function). T
%Then, draw at random (using the function ) the value of each entry from a uniform distribution in the range and multiply each by a random sign

indices = randperm(dimension, cardinality);

x0 = zeros( 1, dimension );

for index=1:size(indices,2)
   sign = ( round(rand()) * 2 - 1 );
   x0( indices(index) ) = randn_bounds(min_bounds,max_bounds) * sign;
end


end


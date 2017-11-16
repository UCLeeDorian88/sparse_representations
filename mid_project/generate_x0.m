function x0 = generate_x0(dimension, cardinality, min, max)
%Generate a sparse vector of cardinality. 
%Draw at random the  locations of the non-zero entries (using Matlab's function). T
%Then, draw at random (using the function ) the value of each entry from a uniform distribution in the range and multiply each by a random sign

indices = randperm(dimension, cardinality);

x0 = zeroes( dimension );

x0 = x0 + indices;

end


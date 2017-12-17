function [A_eff_normalized, atoms_norm] = compute_effective_dictionary(A)
% COMPUTE_EFFECTIVE_DICTIONARY Computes the subsampled and normalized
%   dictionary
%
% Input:
%  A     - Dictionary of size (n x m)
%
% Output:
%  A_eff_normalized - The subsampled and normalized dictionary of size (p*n^2 x m)
%  atoms_norm - A vector of length m, containing the norm of each sampled atom


% TODO: Compute the norm of each atom
% Write your code here...  atoms_norm = ????;
atoms_norm = sqrt( diag(A'*A) );

% TODO: Normalize the columns of A_eff, avoid division by zero
% Write your code here...  A_eff_normalized = ????;
A_eff_normalized = A / diag(atoms_norm);

% norm of columns t = sqrt( sum( A_eff_normalized.^2, 1));

%requriement for the upper function to be able to unnormalize
atoms_norm = atoms_norm';
    
end


function A_normalized = norm_columns(A)
% Normalizes columns of matrix with the L2 Norm

columns = size(A,2);

column_norm = zeros(columns,1);

for col=1:columns
    column_norm(col,1)=norm(A(:,col));
end

A_normalized = zeros(size(A));

for col=1:columns
   A_normalized(:,col) = A(:,col) / column_norm(col); 
end

end


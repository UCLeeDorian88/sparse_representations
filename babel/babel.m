function v = babel(A_normalized, p)
% computes the babel function of a matrix A_normalized

G = A_normalized'*A_normalized;

Gs = G;

for i = 1:size(G,1)
    Gs( i, :) = sort( G(i,:),'descend');
end

[n,m] = size(Gs);
B = zeros( n, m - 1 );

B(:,1) = Gs(:,2);
B(:,2) = Gs(:,2) + Gs(:,3);
B(:,3) = Gs(:,2) + Gs(:,3) + Gs(:,4);


%for i= 1:n
%    for j = 2:m
%        for k = 2:j
%           B(i,j-1) = B(i,j-1) + Gs(i,k);
%        end
%    end
%end

v = max(B(:,p));
   






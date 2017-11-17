function error = compute_support_error( support, estimated_support)
% compute support error 1 - |support ^ estimated_support| / max { 


max_n = max ( max(support), max(estimated_support));

v0 = zeros(1, max_n);
v1 = zeros(1, max_n);

for n = 1:size(support,2)
    v0( support(n) ) = 1;
end

for n = 1:size(estimated_support,2)
    v1( estimated_support(n) ) = 1;
end

intersection = nnz(v0.*v1);

cardinality0 = nnz(support);
cardinality1 = nnz(estimated_support);

error = 1 - intersection / max( cardinality0, cardinality1);

end


function r = randn_bounds(min_bound, max_bound)
% returns random in the open interval (1;3)
% in the course it is written [1;3], so this needs more work
r = (max_bound - min_bound).*rand() + min_bound;
end


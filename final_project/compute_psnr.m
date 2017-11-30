function [ psnr_val ] = compute_psnr(y_original, y_estimated)
% COMPUTE_PSNR Computes the PSNR between two images
%
% Input:
%  y_original  - The original image
%  y_estimated - The estimated image
%
% Output:
%  psnr_val - The Peak Signal to Noise Ratio (PSNR) score

y_original      = y_original(:);
y_estimated     = y_estimated(:);

% TODO: Compute the dynamic range
% Write your code here... dynamic_range = ????;
dynamic_range   = max(y_original) - min(y_original);

% TODO: Compute the Mean Squared Error (MSE)
% Write your code here... mse_val = ????;

norm_val = norm( y_original - y_estimated);
mse_val = (1.0/40.0) * norm_val * norm_val;

% TODO: Compute the PSNR
% Write your code here... psnr_val = ????;
psnr_val = 10 * log10( (dynamic_range * dynamic_range) / (mse_val + 0.000001) );

end


function [ mse_val ] = compute_mse(y_original, y_estimated)
% COMPUTE_mse Computes the mse between two images
%
% Input:
%  y_original  - The original image
%  y_estimated - The estimated image
%
% Output:
%  mse_val - The Peak Signal to Noise Ratio (PSNR) score

y_original      = y_original(:);
y_estimated     = y_estimated(:);

norm_val = norm( y_original - y_estimated);
mse_val = (1.0/( 40.0 * 40.0) ) * norm_val * norm_val;

end


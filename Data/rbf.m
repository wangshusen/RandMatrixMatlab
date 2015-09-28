function [K] = rbf(X1, X2, sigma)
% input:
%   X1: n1-by-d
%   X2: n2-by-d
% output:
%   K: n1-by-n2
%   K(i,j) = exp( -0.5*sigma^2 * norm(X1(i, :) - X2(j, :))^2 )


K = X1 * X2';
X1_row_sq = sum(X1.^2, 2) / 2;
X2_row_sq = sum(X2.^2, 2) / 2;
K = bsxfun(@minus, K, X1_row_sq);
K = bsxfun(@minus, K, X2_row_sq');
K = K / (sigma^2);
K = exp(K);

end
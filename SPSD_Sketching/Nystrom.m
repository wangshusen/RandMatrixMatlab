function [L] = Nystrom(X, sigma, s)
k = ceil(0.8 * s); % can be tuned
n = size(X, 1);
S = sort(randsample(n, s)); % uniform sampling
C = rbf(X, X(S, :), sigma); % C = K(:, S)
W = C(S, :);
[UW, SW, ~] = svd(W);
SW = diag(SW);
SW = 1 ./ sqrt(SW(1:k));
UW = bsxfun(@times, UW(:, 1:k), SW');
L = C * UW; % K is approximated by L * L'
end
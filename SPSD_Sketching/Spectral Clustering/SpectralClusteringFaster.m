function [labels] = SpectralClusteringFaster(X, sigma, k)
s = k * 10; % can be tuned
n = size(X, 1);
[QC, Z] = spsdFaster(X, sigma, s); % K is approximated by QC * Z * QC'
[UZ, SZ, ~] = svd(Z);
SZ = sqrt(diag(SZ));
UZ = bsxfun(@times, UZ, SZ'); % now Z = UZ * UZ'
L = QC * UZ; % now K is approximated by L * L'
d = ones(n, 1);
d = L * (L' * d); % diagonal of the degree matrix D
d = 1 ./ sqrt(d);
L = bsxfun(@times, L, d); % now G is approximated by L*L'
[U, ~, ~] = svd(L, 'econ');
U = U(:, 1:k);
U = normr(U); % normalize the rows of U
labels = kmeans(U, k, 'Replicates', 3);
end
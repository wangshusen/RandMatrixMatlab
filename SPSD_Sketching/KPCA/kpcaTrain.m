function [U, lambda, featuretrain] = kpcaTrain(Xtrain, sigma, k)
s = k * 10; % can be tuned
[QC, Z] = spsdFaster(Xtrain, sigma, s); % QC has orthogonal columns
clear Xtrain
[UZ, SZ, ~] = svd(Z);
U = QC * UZ(:, 1:k); % U contains the top k eigenvectors
lambda = diag(SZ);
lambda = lambda(1:k); % lambda is the vector containing the top k eigenvalues
featuretrain = bsxfun(@times, U, (sqrt(lambda))');
end
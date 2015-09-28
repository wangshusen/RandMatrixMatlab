function [featuretest] = kpcaTestCUR(Xtrain, Xtest, sigma, U, lambda)
c = max(100, ceil(size(Xtrain, 1) / 20)); % can be tuned
r = max(100, ceil(size(Xtest, 1) / 20)); % can be tuned
[C, Utilde, R] = curFasterKernel(Xtest, Xtrain, sigma, c, r);
U = bsxfun(@times, U, (1 ./ sqrt(lambda))');
featuretest = C * (Utilde * (R * U));
end
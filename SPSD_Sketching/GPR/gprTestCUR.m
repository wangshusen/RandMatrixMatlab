function [ytest] = gprTestCUR(Xtrain, Xtest, sigma, w)
c = max(100, ceil(size(Xtrain, 1) / 20)); % can be tuned
r = max(100, ceil(size(Xtest, 1) / 20)); % can be tuned
[C, Utilde, R] = curFasterKernel(Xtest, Xtrain, sigma, c, r);
ytest = C * (Utilde * (R * w));
end
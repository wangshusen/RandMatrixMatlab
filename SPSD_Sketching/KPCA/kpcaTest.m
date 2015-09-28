function [featuretest] = kpcaTest(Xtrain, Xtest, sigma, U, lambda)
Ktest = rbf(Xtest, Xtrain, sigma);
U = bsxfun(@times, U, (1 ./ sqrt(lambda))');
featuretest = Ktest * U;
end
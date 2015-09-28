function [ytest] = gprTest(Xtrain, Xtest, sigma, w)
Ktest = rbf(Xtest, Xtrain, sigma);
ytest = Ktest * w;
end
% demo_kpca_knn

load('.\Data\mushrooms.mat')
X = full(X);
n = size(X, 1);

% --------------------- parameters --------------------- %
sigma = 3.0; % scaling parameter of the RBF kernel
k = 5; % target rank

% ------- randomly partition training-test data ------- %
ntrain = ceil(n * 0.8); % number of training data;
idx = randperm(n);
X = X(idx, :);
y = y(idx, :);
Xtrain = X(1: ntrain, :);
ytrain = y(1: ntrain);
Xtest = X(ntrain + 1:end, :);
ytest = y(ntrain + 1:end);

% ----------------- extract features ----------------- %
[U, lambda, featuretrain] = kpcaTrain(full(Xtrain), sigma, k); % KPCA
[featuretest] = kpcaTest(Xtrain, Xtest, sigma, U, lambda); % extract features from test data
%[featuretest] = kpcaTestCUR(Xtrain, Xtest, sigma, U, lambda); % extract features from test data, with CUR to speedup

% ----------------- knn classification ----------------- %
[labels] = knnclassify(featuretest, featuretrain, ytrain);
error = (labels ~= ytest);
display(['error rate: ', num2str(sum(error) / length(error))]);



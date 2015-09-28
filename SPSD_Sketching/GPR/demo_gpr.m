% demo_gpr

load('.\Data\abalone.mat')
X = full(X);
n = size(X, 1);

% --------------------- parameters --------------------- %
sigma = 1.0; % scaling parameter of the RBF kernel
alpha = 1.0; % indicating the noise in the observation

% ------- randomly partition training-test data ------- %
ntrain = ceil(n * 0.8); % number of training data;
idx = randperm(n);
X = X(idx, :);
y = y(idx, :);
Xtrain = X(1: ntrain, :);
ytrain = y(1: ntrain);
Xtest = X(ntrain + 1:end, :);
ytest = y(ntrain + 1:end);

% ----------------- GPR predictive mean ----------------- %
w = gprTrain(Xtrain, ytrain, sigma, alpha);
labels = gprTest(Xtrain, Xtest, sigma, w);
%labels = gprTestCUR(Xtrain, Xtest, sigma, w); % use CUR to speedup
error = norm(labels - ytest) / norm(ytest);
display(['error ratio: ', num2str(error)]);



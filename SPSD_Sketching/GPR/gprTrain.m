function [w] = gprTrain(Xtrain, ytrain, sigma, alpha)
l = 100; % can be tuned
L = Nystrom(Xtrain, sigma, l); % K is approximated by L * L'
l = size(L, 2);
w = L' * ytrain;
w = (alpha * eye(l) + L' * L) \ w;
w = ytrain - L * w;
w = w / alpha;
end
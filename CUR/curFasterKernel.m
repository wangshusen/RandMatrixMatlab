function [C, U, R] = curFasterKernel(Xtest, Xtrain, sigma, c, r)
pc = 2 * (r + c); % can be tuned
pr = 2 * (r + c); % can be tuned
m = size(Xtest, 1);
n = size(Xtrain, 1);
SC = sort(randsample(n, c));
SR = sort(randsample(m, r));
C = rbf(Xtest, Xtrain(SC, :), sigma);
R = rbf(Xtest(SR, :), Xtrain, sigma);
PC = sort(randsample(m, pc));
PR = sort(randsample(n, pr));
PC = unique([PC; SR]); % enforce PC to contain SR
PR = unique([PR; SC]); % enforce PR to contain SC
Kblock = rbf(Xtest(PC, :), Xtrain(PR, :), sigma);
U = pinv(C(PC, :)) * Kblock * pinv(R(:, PR));
end
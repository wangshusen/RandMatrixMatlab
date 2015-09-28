function [C, idx] = LeverageScoreSampling(A, s)
n = size(A, 2);
[~, ~, V] = svd(A, 'econ');
leveragescores = sum(V.^2, 2);
prob = leveragescores / sum(leveragescores);
idx = randsample(n, s, true, prob);
idx = unique(idx); % eliminate duplicates
C = A(:, idx);
end
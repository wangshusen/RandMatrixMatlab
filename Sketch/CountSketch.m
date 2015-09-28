function [C] = CountSketch(A, s)
[m, n] = size(A);
sgn = randi(2, [1, n]) * 2 - 3; % one half are +1 and the rest are -1
A = bsxfun(@times, A, sgn); % flip the signs of each column w.p. 50%
ll = randsample(s, n, true); % sample n items from [s] with replacement
C = zeros(m, s); % initialize C
for j = 1: n
    C(:, ll(j)) = C(:, ll(j)) + A(:, j);
end
% for j = 1: c
%     idx = (ll == j); % find the columns of A which should be added to C(:, j)
%     C(:, j) = sum(A(:, idx), 2);
% end
end
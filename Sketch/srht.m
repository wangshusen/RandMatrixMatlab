function [C] = srht(A, s)
n = size(A, 2);
sgn = randi(2, [1, n]) * 2 - 3; % one half are +1 and the rest are -1
A = bsxfun(@times, A, sgn); % flip the signs of each column w.p. 50%
n = 2^(ceil(log2(n))); 
C = (fwht(A', n))'; % Hadarmard transform
idx = sort(randsample(n, s));
C = C(:, idx); % subsampling
C = C * (n / sqrt(s));
end
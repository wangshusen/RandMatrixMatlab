function [C, U, R] = curPrototype(A, c, r)
[m, n] = size(A);
SC = sort(randsample(n, c));
SR = sort(randsample(m, r));
C = A(:, SC);
R = A(SR, :);
U = pinv(C) * A * pinv(R);

end
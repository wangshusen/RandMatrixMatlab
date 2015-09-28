function [U, S, V] = BlockLanczos(A, k, q)
s = 2 * k; % can be tuned
[m, n] = size(A);
C = A * randn(n, s);
Krylov = zeros(m, s * q);
Krylov(:, 1:s) = C;
for i = 2: q
    C = A' * C;
    C = A * C;
    [C, ~] = qr(C, 0); % optional
    Krylov(:, (i-1)*s+1: i*s) = C;
end
[Q, ~] = qr(Krylov, 0);
[Ubar, S, V] = svd(Q' * A, 'econ');
Ubar = Ubar(:, 1:k);
S = S(1:k, 1:k);
V = V(:, 1:k);
U = Q * Ubar;
end
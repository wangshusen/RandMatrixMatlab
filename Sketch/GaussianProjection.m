function [C] = GaussianProjection(A, c)
n = size(A, 2);
S = randn(n, c) / sqrt(c);
C = A * S;
end
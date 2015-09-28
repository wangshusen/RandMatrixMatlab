function [QC, Z] = spsdFaster(X, sigma, s)
p = 4 * s; % can be tuned
n = size(X, 1);
S = sort(randsample(n, s)); % uniform sampling
C = rbf(X, X(S, :), sigma); 
[QC, ~] = qr(C, 0);
q = sum(QC.^2, 2); % the sampling probability
q = q / sum(q);
P = randsample(n, p,true, q);
P = unique([P; S]); % enforce P contains S
PQCinv = pinv(QC(P, :));
Ksub = rbf(X(P, :), X(P, :), sigma);
Z = PQCinv * Ksub * PQCinv';
end
function [Utilde, Stilde, Vtilde] = ksvdFaster(A, k, s, p1, p2)
n = size(A, 2);
C = CountSketch(A, s);
A = [A, C];
A = A';
sketch = CountSketch(A, p1);
clear A % A (m-by-n) will not be used
sketch = GaussianProjection(sketch, p2);
sketch = sketch';
L = sketch(:, 1:n);
D = sketch(:, n+1:end);
clear sketch % sketch (p2-by-(n+c)) will not be used
[QD, RD] = qr(D, 0);
[Ubar, Sbar, Vbar] = svds(QD' * L, k);
clear L % L (p2-by-n) will not be used
C = C * (pinv(RD) * (Ubar * Sbar));
[Utilde, Stilde, Vhat] = svd(C, 'econ');
Vtilde = Vbar * Vhat;

end
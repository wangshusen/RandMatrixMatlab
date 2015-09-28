function [Utilde, Stilde, Vtilde] = ksvdPrototype(A, k, s)
C = CountSketch(A, s);
[Q, R] = qr(C, 0);
[Ubar, Stilde, Vtilde] = svds(Q' * A, k);
Utilde = Q * Ubar;
end
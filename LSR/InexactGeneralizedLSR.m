function [Xtilde] = InexactGeneralizedLSR(A, C, B, s1, s2)
[~, idxA] = LeverageScoreSampling(A', s1);
[~, idxC] = LeverageScoreSampling(C, s2);
Xtilde = pinv(A(idxA, :)) * B(idxA, idxC) * pinv(C(:, idxC));
end
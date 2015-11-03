function [Xtilde] = InexactCurTypeRegression(C, R, A, sc, sr)
[~, idxC] = LeverageScoreSampling(C', sc);
[~, idxR] = LeverageScoreSampling(R, sr);
Xtilde = pinv(C(idxC, :)) * A(idxC, idxR) * pinv(R(:, idxR));
end
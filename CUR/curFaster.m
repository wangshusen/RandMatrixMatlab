function [C, U, R] = curFaster(A, c, r)
pc = 2 * (r + c); % can be tuned
pr = 2 * (r + c); % can be tuned
[m, n] = size(A);
SC = sort(randsample(n, c));
SR = sort(randsample(m, r));
C = A(:, SC);
R = A(SR, :);
PC = sort(randsample(m, pc));
PR = sort(randsample(n, pr));
PC = unique([PC; SR]); % enforce PC to contain SR
PR = unique([PR; SC]); % enforce PR to contain SC
U = pinv(C(PC, :)) * A(PC, PR) * pinv(R(:, PR));

end
% demo_CUR

% ----------- parameters ----------- %
c = 100;
r = 100;

% ----------- load data ----------- %
A = imread('./Data/original.png');
A = double(A) / 256;

% ----------- CUR ----------- %
[C1, U1, R1] = curPrototype(A, c, r);
[C2, U2, R2] = curFaster(A, c, r);



% ----------- show images ----------- %
subplot(1, 3, 1), imshow(A), title('A')
subplot(1, 3, 2), imshow(C1 * U1 * R1), title('C * Ustar * R')
subplot(1, 3, 3), imshow(C2 * U2 * R2), title('C * Utilde * R')
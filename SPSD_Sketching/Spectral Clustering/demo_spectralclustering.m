% demo_spectralclustering
load('.\Data\mushrooms.mat')
X = full(X);
sigma = 3.0; % scaling parameter of the RBF kernel
k = 2; % number of classes
[labels] = SpectralClusteringFaster(X, sigma, k);
ac = accuracy(labels, y);
NMI = nmi(labels, y);
display(['Accuracy: ', num2str(ac), '    nmi: ', num2str(NMI)]);
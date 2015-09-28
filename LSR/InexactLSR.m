function [xtilde] = InexactLSR(A, b, s)
d = size(A, 2);
sketch = (CountSketch([A, b]', s))';
Asketch = sketch(:, 1:d); % Asketch = S' * A
bsketch = sketch(:, end); % bsketch = S' * b
xtilde = Asketch \ bsketch;
end

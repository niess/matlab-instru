clear all;
close all;

Ne = 12;
score = ones(Ne, 1);

Francais      = min(max(round(20*(score+0.33*randn(Ne, 1)))/2, 0), 20);
Anglais       = min(max(round(20*(score+0.33*randn(Ne, 1)))/2, 0), 20);
Mathematiques = min(max(round(20*(score+0.33*randn(Ne, 1)))/2, 0), 20);
Physique      = min(max(round(20*(score+0.33*randn(Ne, 1)))/2, 0), 20);
Chimie        = min(max(round(20*(score+0.33*randn(Ne, 1)))/2, 0), 20);

coeffs = [3, 3, 5, 6, 6];

moyenne = ...
    coeffs(1)*Francais + ...
    coeffs(2)*Anglais  + ...
    coeffs(3)*Mathematiques + ...
    coeffs(4)*Physique + ...
    coeffs(5)*Chimie;
moyenne = moyenne/sum(coeffs);

moyenne = round(2*moyenne)/2;

A = [Francais, Anglais, Mathematiques, Physique, Chimie];

B = [A, moyenne];
for i = 1:size(B, 1)
    fprintf(' %4.1f', B(i, :));
    fprintf('\n');
end

B = [11.0  9.0 10.5  8.0  6.0  8.5
 12.5  7.0 11.5 10.5 10.0 10.5
  9.0  2.0 14.5 10.0 10.0 10.0
 17.0 11.0 12.5  9.0 17.5 13.5
  9.0 12.0 11.5 13.0 12.5 12.0
 12.5 17.0  1.0  9.5  3.5  7.5
 14.0 11.0  6.5 10.5  9.5 10.0
 12.0 15.5 11.0  8.5  8.0 10.5
  9.0  9.5 14.0  9.5 17.5 12.5
  2.5 11.5  8.5 11.5 12.0 10.0
 11.0 12.0 10.0  8.0  8.5  9.5
 10.5  6.0 10.0  9.5  8.0  9.0
];
A = B(:, 1:end-1);
moyenne = B(:, end);

c = pinv(A)*moyenne;
3*c/c(2)


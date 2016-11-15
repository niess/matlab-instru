% coefficients.m: permet de retrouver les coefficients entiers ayant
% servit au calcul des moyennes. Les valeurs exactes de coefficients
% sont:
%
% +  Francais:  3
% +  Anglais:   3
% +  Maths:     5
% +  Physique:  6
% +  Chimie:    6

clear all;
close all;

% Les notes et moyenne, sous forme de matrice.
data = [
 11.0  9.0 10.5  8.0  6.0  8.5
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

% On extrait les notes, et les moyennes de sorte a se ramener
% a un probleme lineaire de la forme A*X = B, ou X est le
% vecteur des coefficients normalises que l'on cherche.Soit:
% X = c/sum(c), ou c est le vecteur des coefficients.
A = data(:, 1:end-1);
B = data(:, end);

% Du fait des arrondis lors de la transcription des moyennes
% le systeme d'equation n'admet pas de solution exacte. On 
% utilise un pseudo inverse qui nous donne la meilleure solution
% au sens des moindres carres. Minimisant |A*X-B|^2.
X = pinv(A)*B;

% Pour retrouver la normalisation `sum(c)` on utilise le fait que
% coefficient de l'Anglais vaut 3. Aussi: sum(c)=3/X(2). Soit
% finalement, le vecteur de coeficients entiers, apres arondi est:
round(3*X/X(2))

% A titre de compraraison voici ce que donne l'inversion du
% systeme d'equation en reduisant A a une matrice carree
% contenant les 5 1ere lignes:
X = inv(A(1:5,:))*B(1:5);
round(3*X/X(2))

% Et avec les 5 dernieres lignes:
X = inv(A(end-4:end,:))*B(end-4:end);
round(3*X/X(2))
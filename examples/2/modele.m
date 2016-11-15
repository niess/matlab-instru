function y = modele(t, X)
% Y = MODELE(T, X)  fonction definissant le modele a ajuster.
%
% y = modele(t, X) renvoi les valeurs predites par le modele au
% temps t. Les parametres X du modele sont les valeurs a ajuster.

y = X(1)*exp(-0.5*(t-X(2)).^2/X(3)^2);
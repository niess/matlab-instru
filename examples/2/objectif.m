function cout = objectif(X, t, y)
% COUT = OBJECTIF(X, T, Y)    fonction d'objectif de moindre carre.
%
% cout = objectif(X, t, y) renvoit la valeur du cout d'un modele au point X
% de l'espace des parametres. Le cout est definie comme le module carre des
% ecarts entre les valeurs `modele(t, X)` predites par le modele et la valeur
% mesurees, y.

cout = mean((y - modele(t, X)).^2);
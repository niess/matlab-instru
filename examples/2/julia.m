function Z = julia(Z, x0, y0)
% Z = JULIA(Z, X0, Y0)  Trace de l'ensemble de Julia.
%
% julia(Z, X0, Y0) applique la relation de reccurence z_{n+1} = z_{n}^2 + c 
% et represente graphiquement le module de |z_{n+1}| en fonction de la valeur
% initiale z_{0}.
%
% Pour l'initialisation, on peut generer z_{0} avec la fonction meshgrid, 
% selon:
%
%      x0 = -1.5:0.005:1.5;
%      y0 = -1.5:0.005:1.5;
%      [X0,Y0] = meshgrid(x0, y0);
%      Z0 = X0+j*Y0;
%
% Notez que x0 et y0 sont passes en argument de `julia` pour le trace. Modifiez
% `c` dans le code pour realiser differentes figures.

% Relation de reccurence.
c = 0.285+j*0.01;
Z = Z.^2 + c;
 
% Trace du module de Z.
colormap hot;
imagesc(x0, y0, exp(-abs(Z)));   % On represente exp(-|Z|) en fait. Pour projeter
axis equal;                      % [0;+inf[ dans ]0;1] ce qui donne un meilleur contraste.
colorbar;
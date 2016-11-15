% Cercle.m: trace d'un cercle avec differents pas d'echantillonage.

clear all;
close all;

figure;
% 1er cercle avec pas pi/4.
phi = [-pi:pi/4:pi];
x = cos(phi);
y = sin(phi);
plot(x, y, 'ko-');
hold on;

% 2eme cercle avec pas pi/100.
phi = [-pi:pi/100:pi];
x = cos(phi);
y = sin(phi);
plot(x, y, 'r.-');
hold off;
grid on;

% Pour egaliser les axes x et y.
axis equal; 
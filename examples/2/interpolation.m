% interpolation.m: realise l'interpolation lineaire ou par les splines
% d'un echantillonage `grossier` du cercle unite.

clear all;
close all;

% Echantillonage grossier du cercle.
phi = 0:pi/6:2*pi;
x   = cos(phi);
y   = sin(phi);

% Echantillonage fin de l'angle trigonometrique, pour
% l'interpolation.
phip = 0:pi/100:2*pi;

% Valeurs vraies des coordonnees (x, y) pour
% l'echantillonage fin. Notez qu'elles sont
% connues dans ce cas illustratif, ce qui n'est pas
% necessairement le cas.
xp = cos(phip);
yp = sin(phip);

% Interpolation lineaire.
xl = interp1(phi, x, phip);
yl = interp1(phi, y, phip);

% Interpolation par les splines.
xs = spline(phi, x, phip);
ys = spline(phi, y, phip);

% Trace du resultat.
figure;
plot(x, y, 'ko-', 'MarkerFace', 'k');
hold on;
plot(xp, yp, 'g-');
plot(xl, yl, 'b.');
plot(xs, ys, 'r.');
hold off; grid on;
axis equal;
legend('pi/6', 'pi/100', 'lineaire', 'spline');
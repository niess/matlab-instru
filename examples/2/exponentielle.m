% exponentielle.m: illustre l'erreur numerique sur la derivation et l'integration de la fonction exponentielle.

clear all;
close all;

% Echantillonage du signal.
dx = 0.01;
x  = 0:dx:1;
y  = exp(x);

% Derivation numerique.
yd = gradient(y)/dx;

% Primitive numerique.
yp = cumtrapz(y)*dx;

% Comparaison des resultats.
figure; 
plot(x,  y, 'k+');
hold on;
plot(x, yd, 'r-');
plot(x, yp, 'b--');
hold off; grid on;
xlabel('x');
legend('y', 'gradient(y)/dx', 'cumtrapz(y)*dx', 2);

% Redefinition de la primitive tel que F(0) = 1.
yp = yp+1;

% Comparaison des erreurs relatives.
figure;
semilogy(x, abs(yd-y)./y, 'ro', 'MarkerFace', 'r');
hold on;
semilogy(x, abs(yp-y)./y, 'b.');
semilogy(x, ones(size(x))*dx^2/6, 'k-', 'LineWidth', 2);    % Calccul analytique de l'erreur sur la derivee.
hold off; grid on;
xlabel('x');
ylabel('Erreur relative, \epsilon');
legend('|gradient(y)/dx-y|/y', '|cumtrapz(y)*dx+1-y|]/y', 'calcul analytique', 4);
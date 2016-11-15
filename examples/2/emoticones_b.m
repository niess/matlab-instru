% emoticones_b.m: annote les emoticones :) et :(.

clear all;
close all;

phi = -pi:pi/100:pi;                    % construction du cercle unité
x = cos(phi);
y = sin(phi);

figure(1);                              % Emoticône pour :)
plot(x, y, 'k');                        % La tête
axis equal;
hold on;
plot(0.2*x+0.4, 0.2*y+0.4, 'b');        % L'oeil droit
plot(0.2*x-0.4, 0.2*y+0.4, 'b');        % L'oeil gauche
plot(0.5*x(y<0), 0.5*y(y<0), 'r');      % La bouche

title('Monsieur Joyeux');   
xlabel('Largeur');
ylabel('Hauteur');

saveas(gcf, 'joyeux.fig');              % Pour sauvegarder la figure en format
                                        % vectoriel .fig propre a Matlab.


figure(2);                              % Emoticône pour :(
plot(x, y, 'k');                        % La tête
axis equal;
hold on;	
plot(0.2*x-0.4, 0.2*y+0.4, 'g');        % Loeil droit
plot(0.2*x+0.4, 0.2*y+0.4, 'g');        % L'oeil gauche
plot(0.5*x(y>0), 0.5*y(y>0)-0.5, 'c');  % La bouche

title('Monsieur Grognon');
xlabel('Largeur');
ylabel('Hauteur');

saveas(gcf, 'grognon.fig');             % Pour sauvegarder la figure en format
                                        % vectoriel .fig propre a Matlab.

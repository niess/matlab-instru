% emoticones.m: realise le trace des emoticones :) et :( avec des portions de cercle.

clear all;
close all;

phi = -pi:pi/100:pi;                    % construction du cercle unit�
x = cos(phi);
y = sin(phi);

figure(1);                              % Emotic�ne pour :)
plot(x, y, 'k');                        % La t�te
axis equal;
hold on;
plot(0.2*x+0.4, 0.2*y+0.4, 'b');        % L'oeil droit
plot(0.2*x-0.4, 0.2*y+0.4, 'b');        % L'oeil gauche
plot(0.5*x(y<0), 0.5*y(y<0), 'r');      % La bouche

figure(2);                              % Emotic�ne pour :(
plot(x, y, 'k');                        % La t�te
axis equal;
hold on;	
plot(0.2*x-0.4, 0.2*y+0.4, 'g');        % Loeil droit
plot(0.2*x+0.4, 0.2*y+0.4, 'g');        % L'oeil gauche
plot(0.5*x(y>0), 0.5*y(y>0)-0.5, 'c');  % La bouche
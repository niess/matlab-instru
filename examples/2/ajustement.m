function [] = ajustement()
% AJUSTEMENT    exemple d'ajustement d'un modele selon un objectif.
%
% Exemple d'ajustement d'un modele par minimisation d'un objectif. Pour fonctionner
% cet exemple demande d'avoir definie une fonction objectif (ojectif.m) et une 
% fonction modele (modele.m).

    [t, y, s] = mesure_simulee(0.1);
    
    % Initialisation de la minimisation.
    p     = y/trapz(y);
    mu    = trapz(t.*p);
    sigma = sqrt(trapz((t-mu).^2.*p));
    X0 = [max(y), mu, sigma];

    % Ajustement non lineaire.
    X = fminsearch('objectif', X0, [], t, y);
    
    % Trace du resultat.
    figure;
    plot(t, y, 'k.');
    hold on;
    plot(t(1:10:end), s(1:10:end), 'bo', 'MarkerFace', 'b');     % On sous-echantillone le signal pour l'affichage.
    plot(t, modele(t, X0), 'g:', 'LineWidth', 2);
    plot(t, modele(t,  X), 'r-', 'LineWidth', 2);
    hold off; 
    grid on;
    legend('Mesure simulee', 'Signal vrai', 'Initialisation', 'Ajustement');
    xlabel('Temps (s)');
    ylabel('Amplitude (u.a.)');

    
function [t, y, s] = mesure_simulee(bruit)
% Simulation de l'echantillon de mesure. L'amplitude relative du bruit
% est donnee en argument.
    
    dt = 1e-2;
    Fs = 1/dt;
    t  = -0.5:dt:0.5;
    s  = modele(t, [1.0, 0.0, 0.1]);   % Signal pic Gaussien
    b  = bruit*randn(size(s));         % Bruit blanc Gaussien
    y  = s+b;                          % Mesure simulee: signal + bruit.
% analyse.m: analyse l'enregistrement sonore d'un siflet de train.

clear all;
close all;

% Charge le signal.
load('train');
dt = 1/Fs;
n  = length(y);
t  = [0:n-1]*dt;

% Trace de l'amplitude acoustique.
figure;
plot(t, y, 'k');
grid on;
xlabel('Temps (s)');
ylabel('Amplitude (u.a.)');

% Calcul de la transformee de Fourier.
Y = fft(y);
nf = floor(n/2);    % On ne conserve que les frequences positives
Y = Y(1:nf)*dt;     % le signal etant reel. 
f = [0:nf-1]/n*Fs;  

% Trace du spectre de Fourier.
figure;
plot(f, 20*log10(abs(Y)), 'k');
grid on;
xlabel('Frequence (Hz)');
ylabel('Intensite (dB)');

% Calcul et trace du spectrogramme.
[Y, f, t] = specgram(y, [], Fs);

figure;
contourf(t, f, 20*log10(abs(Y)), 5);
grid on;
colorbar;
xlabel('Temps (s)');
ylabel('Frequence (Hz)');
title('Intensite (dB)');
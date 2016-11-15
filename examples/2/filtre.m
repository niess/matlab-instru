% filtre.m: illustre le rejet d'un bruit blanc par filtrage passe bas sur un echantillon de mesures simulees. 

clear all;
close all;

% Simulation de l'echantillon de mesure.
dt = 1e-3;
Fs = 1/dt;
t  = -0.5:dt:0.5;
s  = exp(-0.5*t.^2/0.1^2);    % Signal pic Gaussien
b  = 0.1*randn(size(s));      % Bruit blanc Gaussien
y  = s+b;                     % Mesure simulee: signal + bruit.


% Synthese du filtre et filtrage de la mesure.
fc = 4;
if exist('butter')
    [B, A] = butter(6, fc/(Fs/2));
else
    kc = 1/(2*pi*dt*fc);
    A  = [1+kc, -kc];
    B  = 1;
end


% Densite spectrale du signal, du bruit et de la mesure filtre.
yf = filter(B, A, y);

Nf = 2^11;
[Ps, f] = psd(s,  Nf, Fs);
[Pb, f] = psd(b,  Nf, Fs);
[Pf, f] = psd(yf, Nf, Fs);


% Trace de la mesure simulee.
figure;
plot(t, y, 'k.');
hold on;
plot(t, s, 'r-', 'LineWidth', 2);
grid on;
xlabel('Temps (s)');
ylabel('Amplitude (u.a.)');
legend('Mesure simulee', 'Signal vrai');


% Trace des densites spectrales.
figure;
plot(f, 10*log10(abs(Pb)), 'b:', 'LineWidth', 2);
hold on;
plot(f, 10*log10(abs(Ps)), 'r:', 'LineWidth', 2);
plot(f, 10*log10(abs(Pf)), 'k-', 'LineWidth', 2);
hold off; grid on;
axis([0, 100, -100, 20]);
xlabel('Frequence (Hz)');
ylabel('Puissance (dB)');
legend('Bruit blanc', 'Signal vrai', 'Mesure filtree');


% Trace de la mesure filtree.
figure;
plot(t, yf, 'k.', 'LineWidth', 2);
hold on;
plot(t, s,  'r--', 'LineWidth', 2);
hold off; grid on;
xlabel('Temps (s)');
ylabel('Amplitude (u.a.)');
legend('Mesure filtree', 'Signal vrai');
% denombrement.m: compte la frequence d'occurence des lettres dans les messages d'aide de Matlab. 

clear all;
close all;

% On met bout a bout les textes d'aide de plot
% et de syntaxe.
texte = []
texte = [texte, help('plot')];
texte = [texte, help('syntax')];


% On convertit les lettres de l'alphabet en codes de 0 a 25.
codes = lower(texte)-'a';


% On denombre la frequence d'occurence de chaque lettre.
bins = [0:25];
n = histc(codes, bins);
f = 100*n/sum(n);


% Le resultat est represente par des barres verticales.
bar(bins, f);
xlabel('Lettre');
ylabel('Frequence (%)');
grid on;
axis([min(bins)-1, max(bins)+1, 0, 15]);


% Les 2 lignes suivantes permettent d'afficher les
% lettres de l'alphabet sur l'axe des abscisses.
set(gca, 'xtick', bins);
set(gca, 'xticklabel', char('a'+bins)');


% On ordonne les lettres en fonction de leur
% frequence d'occurence.
[n, K] = sort(n);
bins = bins(K);

lettres = char('a'+bins(end:-1:end-2))
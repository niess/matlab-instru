# Initiation à Matlab

Disponible en ligne depuis

[https://niess.github.io/matlab-instru/](https://niess.github.io/matlab-instru/)

## Session 2

_V. Niess_

_{{now}}_

---

# Objectifs de ce TD

* Les objectifs de cette seconde session de tutoriel sont de disposer des
  éléments nécessaires pour:

  * _Représenter graphiquement_ un ensemble de données.

  * Effectuer des _traitements standards_ de ces données: transformée de
    Fourier, filtrage, ajustements et interpolation.

  Il n’est __pas__ question de traiter __complètement__ le contenu du document
  durant cette session, mais plutôt d’avoir un aperçu de ce qui peut être utile
  pour y revenir par la suite lors des TPs/projets.

---

# Scripts ... #1

_Ou comment Rome ne s’est pas faite en un jour ..._

* Au lieu de taper vos instructions dans la fenêtre de commande vous pouvez les
  écrire dans un fichier, appelé _script Matlab_. Par exemple, depuis le menu
  `File` de Matlab on peut créer un nouveau script, `new M-file`, contenant
  l'instruction suivante:
  ```matlab
  clear all
  ```
  On sauve ensuite le fichier sous le nom de `menage`. Notez que l’extension
  `.m` lui sera affecté.

  > Le nom d'un script ne doit pas `comporter` d’espace, ni d’operateur tel
  > que `+`, `-`, ni commencer par un chiffre.

---

# Scripts ... #2

* Un script peut être _exécuté_ en ligne de commande en tapant simplement son
  nom, selon:
  ```matlab
  >> menage
  ```
  .question[_Q1: Que fait ce script?_]

  De façon générale c’est une bonne idée de commencer votre script avec
  l'instruction précédente pour partir d’un environnement "propre".

* Vous pouvez insérer des _commentaires_ dans vos scripts avec le symbole `%`.
  Le texte qui suit le `%` sera ignoré par l’interpréteur.

  .question[_Q2: que renvoie: `(1+2) %==3`. Et : `(1+2)==3`. Pourquoi?_]

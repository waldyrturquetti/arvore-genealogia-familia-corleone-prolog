%-------------------------------
% Árvore Genealogica da Família Corleone
%-------------------------------

progenitor(antoni_andoline, vito_corleone).
progenitor(antoni_andoline, paolo_andolini).
progenitor(signora_andolini, vito_corleone).
progenitor(signora_andolini, paolo_andolini).

progenitor(vito_corleone, sonny_corleone).
progenitor(vito_corleone, fredo_corleone).
progenitor(vito_corleone, michael_corleone).
progenitor(vito_corleone, connie_corleone).
progenitor(vito_corleone, tom_hagen).
progenitor(vito_corleone, johnny_fontane).

progenitor(carmella_corleone, sonny_corleone).
progenitor(carmella_corleone, fredo_corleone).
progenitor(carmella_corleone, michael_corleone).
progenitor(carmella_corleone, connie_corleone).
progenitor(carmella_corleone, tom_hagen).
progenitor(carmella_corleone, johnny_fontane).

progenitor(sonny_corleone, franck_corleone).
progenitor(sonny_corleone, santino_corleone).
progenitor(sonny_corleone, vincent_mancini).

progenitor(michael_corleone, anthony_corleone).
progenitor(michael_corleone, mary_corleone).

progenitor(connie_corleone, victor_rizzi).
progenitor(connie_corleone, michael_rizzi).

masculino(antoni_andoline).
masculino(vito_corleone).
masculino(paolo_andolini).
masculino(sonny_corleone).
masculino(fredo_corleone).
masculino(michael_corleone).
masculino(tom_hagen).
masculino(johnny_fontane).
masculino(franck_corleone).
masculino(santino_corleone).
masculino(vincent_mancini).
masculino(anthony_corleone).
masculino(victor_rizzi).
masculino(michael_rizzi).

feminino(signora_andolini).
feminino(connie_corleone).
feminino(mary_corleone).

% ----------------------------------------------------------------------

filho(Y,X) :-
        progenitor(X,Y),
        masculino(Y).

filha(Y,X) :-
        progenitor(X,Y),
        feminino(Y).

pai(X,Y) :-
        progenitor(X,Y),
        masculino(X).

mae(X,Y) :-
        progenitor(X,Y),
        feminino(X).

avoM(X,Z) :-
        progenitor(X,Y),
        progenitor(Y,Z),
        masculino(X).

avoF(X,Z) :-
        progenitor(X,Y),
        progenitor(Y,Z),
        feminino(X).

irma(X,Y) :-
        progenitor(Z,X),
        progenitor(Z,Y),
        feminino(X).

irmao(X,Y) :-
        progenitor(Z,X),
        progenitor(Z,Y),
        masculino(X).

tio(X,Y) :-
        progenitor(Z,Y),
        irmao(X,Z),
        masculino(X).

tia(X,Y) :-
        progenitor(Z,Y),
        irmao(X,Z),
        feminino(X).

primo(X,Y) :-
        progenitor(Z,X),
        progenitor(W,Y),
        progenitor(V,Z),
        progenitor(V,W),
        masculino(X).

prima(X,Y) :-
        progenitor(Z,X),
        progenitor(W,Y),
        progenitor(V,Z),
        progenitor(V,W),
        feminino(X).        

antepassado(X,Z) :-
        progenitor(X,Z).

antepassado(X,Z) :-
        progenitor(X,Y),
        antepassado(Y,Z).

% --------------------------------------------- 
% Consultas:
%
% tio(fredo_corleone, michael_rizzi).
%
% prima(mary_corleone, santino_corleone).
%
% antepassado(vito_corleone, fredo_corleone).
% 
% antepassado(vito_corleone, mary_corleone).
%


%wyra�enie(LISTA, WARTO��, WYRA�ENIE)

%wyra�enie([], 0, 0).
%wyra�enie([X|Ogon], Warto��, Wyra�enie) :-
%    (
%
%test(X, Wyra�enie, Wyra�enie1) :-
%    Wyra�enie = X + Wyra�enie1.
%

test(X, Wyra�enie, Wyra�enie1, Warto��, Warto��1) :-
    Wyra�enie = X + Wyra�enie1,
    Warto�� is Warto��1 + X.

test(X, Wyra�enie, Wyra�enie1, Warto��, Warto��1) :-
    Wyra�enie = X - Wyra�enie1,
    Warto�� is X - Warto��1.

test(X, Wyra�enie, Wyra�enie1, Warto��, Warto��1) :-
    Wyra�enie = X * Wyra�enie1,
    Warto�� is X * Warto��1.

test(_, _, 0, _, _) :- !, fail.

test(_, _, _, _, 0) :- !, fail.

test(X, Wyra�enie, Wyra�enie1, Warto��, Warto��1) :-
    Wyra�enie1 \= 0.0,
    Warto��1 \= 0.0,
    Wyra�enie = X / Wyra�enie1,
    Warto�� is X / Warto��1.

wyra�enie([X], X, X).
wyra�enie([X|Ogon], Warto��, Wyra�enie) :-
    wyra�enie(Ogon, Warto��1, Wyra�enie1),
    X \= 0,
    test(X, Wyra�enie, Wyra�enie1, Warto��, Warto��1).


%  Zadanie 1
%

po��czenie_wyra�e�(Wyra�enieOut, Wyra�enie1, Wyra�enie2) :-
    Wyra�enieOut = Wyra�enie1 + Wyra�enie2.

po��czenie_wyra�e�(Wyra�enieOut, Wyra�enie1, Wyra�enie2) :-
    Wyra�enieOut = Wyra�enie1 - Wyra�enie2.

po��czenie_wyra�e�(Wyra�enieOut, Wyra�enie1, Wyra�enie2) :-
    Wyra�enieOut = Wyra�enie1 * Wyra�enie2.

po��czenie_wyra�e�(Wyra�enieOut, Wyra�enie1, Wyra�enie2) :-
    Wyra�enie2 =\= 0,
    Wyra�enieOut = Wyra�enie1 / Wyra�enie2.

wyra�enie3_t([X], X).
wyra�enie3_t(Lista, Wyra�enie) :-
    Xs = [_|_],
    Ys = [_|_],
    append(Xs, Ys, Lista),
    wyra�enie3_t(Xs, Wyra�enie1),
    wyra�enie3_t(Ys, Wyra�enie2),
    po��czenie_wyra�e�(Wyra�enie, Wyra�enie1, Wyra�enie2).

wyra�enie3([X], X, X).
wyra�enie3(Lista, Warto��, Wyra�enie) :-
    Xs = [_|_],
    Ys = [_|_],
    append(Xs, Ys, Lista),
    wyra�enie3_t(Xs, Wyra�enie1),
    wyra�enie3_t(Ys, Wyra�enie2),
    po��czenie_wyra�e�(Wyra�enie, Wyra�enie1, Wyra�enie2),
    Warto�� is Wyra�enie.


%  Zadanie 2
%

first_member(Dom, [Dom|_]).

leftNeighbour(Lewy, Prawy, [Lewy, Prawy|_]).
leftNeighbour(Lewy, Prawy, [_|Ogon]) :-
    leftNeighbour(Lewy, Prawy, Ogon).

rightNeighbour(Prawy, Lewy, [Lewy, Prawy|_]).
rightNeighbour(Prawy, Lewy, [_|Ogon]) :-
    rightNeighbour(Prawy, Lewy, Ogon).

neighbour(Dom1, Dom2, Ulica) :-
    leftNeighbour(Dom1, Dom2, Ulica);
    rightNeighbour(Dom1, Dom2, Ulica).

rybki(Kto) :-
    Ulica = [dom(_, norweg, _, _, _),
             dom(_, _, _, _, _),
             dom(_, _, _, mleko, _),
             dom(_, _, _, _, _),
             dom(_, _, _, _, _)],

    %first_member(dom(_, norweg, _, _, _), Ulica),
    member(dom(czerwony, anglik, _, _, _), Ulica),
    leftNeighbour(dom(zielony, _, _, _, _), dom(bia�y, _, _, _, _), Ulica),
    member(dom(_, du�czyk, _, herbata, _), Ulica),
    neighbour(dom(_, _, _, _, light), dom(_, _, koty, _, _), Ulica),
    member(dom(��ty, _, _, _, cygara), Ulica),
    member(dom(_, niemiec, _, _, fajka), Ulica),
    neighbour(dom(_, _, _, _, light), dom(_, _, _, woda, _), Ulica),
    member(dom(_, _, ptaki, _, bezfiltra), Ulica),
    member(dom(_, szwed, psy, _, _), Ulica),
    neighbour(dom(_, norweg, _, _, _), dom(niebieski, _, _, _, _), Ulica),
    neighbour(dom(_, _, konie, _, _), dom(��ty, _, _, _, _), Ulica),
    member(dom(_, _, _, piwo, mentole), Ulica),
    member(dom(zielony, _, _, kawa, _), Ulica),
    member(dom(_, Kto, rybki, _, _), Ulica).


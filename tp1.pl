%%%%%Parte 1%%%%

%Q1: Um predicado que insere um elemento no final da lista.
insere_fim(Insere,[], [Insere]).
insere_fim(Insere, [H|T], [H|Novo]) :- insere_fim(Insere, T, Novo).

%Q2: Um predicado que insere um elemento em uma determinada posição da lista.
insere_lista(Pos,Elemento, [H|T], X) :- insere_listaAux(Pos, Elemento, 1, [H|T], X).
insere_listaAux(Pos, Elemento, Pos, [H|T], [Elemento|[H|T]]).
insere_listaAux(Pos, Elemento, Pos, [], [Elemento]).
insere_listaAux(Pos, Elemento,  Cont, [H|T], [H|T1]) :- ContT is  1+Cont ,insere_listaAux(Pos, Elemento, ContT, T, T1).

%Q3: Um predicado que remove um elemento em uma determinada posição da lista.
remove_lista(Pos, [H|T], X) :- remove_listaAux(Pos, 1,[H|T], X).
remove_listaAux(Pos, Pos, [_|T], T).
remove_listaAux(Pos, Cont, [H|T], [H|T1]) :- ContT is 1+Cont,remove_listaAux(Pos, ContT, T, T1).

%Q4: Um predicado que retorne o maior valor contido em uma lista numérica.
max_lista([H],H).
max_lista([H|T],Max) :- max_lista(T, Max1), (((Max1>=H) -> Max=Max1);((Max1<H)-> Max=H)).

%Q5: Um predicado que escreve uma lista em ordem inversa. Dica: utilize concatenação.
inverte_lista([H], [H]).
inverte_lista([H|T], X) :- inverte_lista(T, X2), insere_fim(H,X2,X).

%%%%%Parte 2%%%%

% Fatos
% Sexo
masculino(george).
masculino(spencer).
masculino(charles).
masculino(philip).
masculino(mark).
masculino(andrew).
masculino(edward).
masculino(william).
masculino(harry).
masculino(peter).
masculino(eugenie).
masculino(james).
feminino(mum).
feminino(kydd).
feminino(elizabeth).
feminino(margaret).
feminino(diana).
feminino(anne).
feminino(sarah).
feminino(sophie).
feminino(zara).
feminino(beatrice).
feminino(louise).

% Parentesco
genitor(george, elizabeth).
genitor(mum, elizabeth).
genitor(george, margaret).
genitor(mum, margaret).
genitor(spencer, diana).
genitor(kydd, diana).
genitor(elizabeth, charles).
genitor(elizabeth, anne).
genitor(elizabeth, andrew).
genitor(elizabeth, edward).
genitor(philip, charles).
genitor(philip, anne).
genitor(philip, andrew).
genitor(philip, edward).
genitor(diana, william).
genitor(diana, harry).
genitor(charles, william).
genitor(charles, harry).
genitor(anne, peter).
genitor(anne, zara).
genitor(mark, peter).
genitor(mark, zara).
genitor(andrew, beatrice).
genitor(andrew, euginie).
genitor(sarah, beatrice).
genitor(sarah, eugenie).
genitor(edward, louise).
genitor(edward, james).
genitor(sophie, louise).
genitor(sophie, james).

% Regras
filho(X, Y) :-
    genitor(Y, X),
    masculino(X).

filha(X, Y) :-
    genitor(Y, X),
    feminino(X).

netoOuNeta(Z, X) :-
    genitor(Y, Z),
    genitor(X, Y).

bisavoOuBisavo(X, Y) :-
    genitor(X, Z),
    genitor(Z, W),
    genitor(W, Y).

irmao(X, Y) :-
    genitor(Z, X),
    genitor(Z, Y),
    masculino(Y),
    X \== Y.

irma(X, Y) :-
    genitor(Z, X),
    genitor(Z, Y),
    feminino(Y),
    X \== Y.

irmaoOuIrma(X, Y) :-
    genitor(Z, X),
    genitor(Z, Y),
    X \== Y.

primoIrmao(X, Y) :-
    netoOuNeta(X, Z),
    netoOuNeta(Y, Z),
    masculino(X),
    masculino(Y),
    X \== Y.

tio(X, Y) :-
    irmao(X, Z),
    genitor(Z, Y).

tia(X, Y) :-
    irma(X, Z),
    genitor(Z, Y).

casados(X, Y) :-
    genitor(X, Z),
    genitor(Y, Z).

cunhado(X, Y) :-
    casados(Z, X),
    irmaoOuIrma(Z, Y),
    masculino(X).

cunhada(X, Y) :-
    casados(Z, X),
    irmaoOuIrma(Z, Y),
    feminino(X).


ancestral(X, Y) :-
    genitor(X, Y).
ancestral(X, Y) :-
    genitor(Z, X),
    ancestral(Y, Z).

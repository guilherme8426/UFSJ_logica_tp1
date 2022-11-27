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

homem(george).
homem(spencer).
homem(philip).
homem(charles).
homem(mark).
homem(andrew).
homem(edward).
homem(william).
homem(harry).
homem(peter).
homem(eugenie).
homem(james).

mulher(mum).
mulher(kydd).
mulher(elizabeth).
mulher(margaret).
mulher(diana).
mulher(anne).
mulher(sarah).
mulher(sophie).
mulher(zara).
mulher(beatrice).
mulher(louise).

casados(george,mum).
casados(spencer,kydd).
casados(elizabeth,philip).
casados(diana,charles).
casados(anne,mark).
casados(andrew,sarah).
casados(edward,sophie).
casados(X,Y) :- casados(Y,X).

filho(charles,elizabeth).
filho(andrew,elizabeth).
filho(edward,elizabeth).
filho(william,charles).
filho(harry,charles).
filho(peter,anne).
filho(eugenie,sarah).
filho(james,sophie).
filho(X,Y):-casados(Y,Z),filho(X,Z).

filha(elizabeth,george).
filha(margaret,george).
filha(diana,kydd).
filha(anne,philip).
filha(zara,mark).
filha(beatrice,sarah).
filha(louise,sophie).
filha(X,Y):-casados(Y,Z), filha(X,Z).

neto_ou_neta(Neto_a,Avo):-((homem(Neto_a)->filho(Neto_a,Y), (filho(Y,Avo);filha(Y,avo));mulher(Neto_a)->filha(Neto_a,Y)), ((filho(Y,Avo);filha(Y,avo)))).



















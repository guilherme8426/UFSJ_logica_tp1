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
casados(Marido,Esposa) :- casados(Esposa,Marido).

filhaoufilho(charles,elizabeth).
filhaoufilho(andrew,elizabeth).
filhaoufilho(edward,elizabeth).
filhaoufilho(william,charles).
filhaoufilho(harry,charles).
filhaoufilho(peter,anne).
filhaoufilho(eugenie,sarah).
filhaoufilho(james,sophie).
filhaoufilho(elizabeth,george).
filhaoufilho(margaret,george).
filhaoufilho(diana,kydd).
filhaoufilho(anne,philip).
filhaoufilho(zara,mark).
filhaoufilho(beatrice,sarah).
filhaoufilho(louise,sophie).
filhaoufilho(Filho,Pai) :- casados(Pai,Mae), filhaoufilho(Filho,Mae).

netoouneta(Neto, Avo) :- filhaoufilho(Neto,Pai),filhaoufilho(Pai,Avo).

bisavooubisavo(Bisneto,Bisavo) :- netoouneta(Bisneto,Avo),filhaoufilho(Avo, Bisavo).

ancestral(Pessoa,Ancestral) :- filhaoufilho(Pessoa,Ancestral);netoouneta(Pessoa,Ancestral);bisavooubisavo(Pessoa,Ancestral).

irmao(Irmao, Irmao2):-homem(Irmao),filhaoufilho(Irmao,Pai),filhaoufilho(Irmao2,Pai).

irma(Irma, Irmao2):-mulher(Irma),filhaoufilho(Irma,Pai),filhaoufilho(Irmao2,Pai).

irmao_aux(Irmo1,Irmao2):- irmao(Irmo1,Irmao2);irma(Irmo1,Irmao2).

filho(Filho,Pai_Mae):-homem(Filho),filhaoufilho(Filho,Pai_Mae).

filha(Filha,Pai_Mae):-homem(Filha),filhaoufilho(Filha,Pai_Mae).

primoirmao(Primo1, Primo2):-filhaoufilho(Primo1,Pai1),filhaoufilho(Primo2,Pai2),(irmao(Pai1,Pai2);irma(Pai1,Pai2)).

% cunhado(Cunhado1,Cunhado2):-homem(Cunhado1),((casado(Cunhado1,Irmao),irmao_Aux(Cunhado2,Irmao));(casado(Cunhado2,Irmao),irmao_Aux(Cunhado2,Irmao))).
%

% cunhada(Cunhado1,Cunhado2):-
% mulher(Cunhado1),((casado(Cunhado1,Irmao),irmao_Aux(Cunhado2,Irmao));(casado(Cunhado2,Irmao),irmao_Aux(Cunhado2,Irmao))).
%

tia(Tia,Sobrinho):-mulher(Tia),filhaoufilho(Sobrinho, Pai) ,irma(Tia, Pai).

tio(Tio,Sobrinho):-homem(Tio),filhaoufilho(Sobrinho, Pai) ,irmao(Tio, Pai).






















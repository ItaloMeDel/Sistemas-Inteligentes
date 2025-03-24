hombre(italo).
hombre(artemio).
hombre(maximiliano).
hombre(waldomar).

mujer(florence).
mujer(magda).
mujer(mary).
mujer(ana).

es_padre_de(artemio, florence).
es_padre_de(maximiliano, artemio).
es_padre_de(artemio, waldomar).
es_padre_de(waldomar, ana).

es_madre_de(magda, florence).
es_madre_de(mary, artemio).
es_madre_de(magda, waldomar).
es_madre_de(florence, italo).

es_hijo_de(X, Y) :-
    hombre(X),
    ( es_padre_de(Y, X) ; es_madre_de(Y, X) ),
    write(X), write(' es hijo de '), write(Y), nl.

es_hija_de(X, Y) :-
    mujer(X),
    ( es_padre_de(Y, X) ; es_madre_de(Y, X) ),
    write(X), write(' es hija de '), write(Y), nl.

es_hermano_de(X, Y) :-
    hombre(X),
    es_padre_de(Z, X),
    es_padre_de(Z, Y),
    X \= Y,
    write(X), write(' es hermano de '), write(Y), nl.

es_hermana_de(X, Y) :-
    mujer(X),
    es_padre_de(Z, X),
    es_padre_de(Z, Y),
    X \= Y,
    write(X), write(' es hermana de '), write(Y), nl.

es_abuelo_de(X, Y) :-
    hombre(X),
    ( es_padre_de(X, Z), ( es_padre_de(Z, Y) ; es_madre_de(Z, Y) ) ),
    write(X), write(' es abuelo de '), write(Y), nl.

es_abuela_de(X, Y) :-
    mujer(X),
    ( es_madre_de(X, Z), ( es_padre_de(Z, Y) ; es_madre_de(Z, Y) ) ),
    write(X), write(' es abuela de '), write(Y), nl.

es_tio_de(X, Y) :-
    hombre(X),
    ( es_padre_de(Z, Y) ; es_madre_de(Z, Y) ),
    es_hermano_de(X, Z),
    write(X), write(' es tío de '), write(Y), nl.

es_tia_de(X, Y) :-
    mujer(X),
    ( es_padre_de(Z, Y) ; es_madre_de(Z, Y) ),
    es_hermana_de(X, Z),
    write(X), write(' es tía de '), write(Y), nl.

:- discontiguous
        movie/2,
        director/2,
        actor/2,
        actress/2.

movie(drive, 2011).
director(drive, nicolas_winding).
actor(drive, ryan_gosling).
actress(drive, carey_mulligan).
actor(drive, bryan_cranston).

movie(la_la_land, 2016).
director(la_la_land, damien_chazelle).
actor(la_la_land, ryan_gosling).
actress(la_la_land, emma_stone).
actress(la_la_land, rosemarie_dewitt).

movie(the_notebook, 2004).
director(the_notebook, nick_cassavetes).
actor(the_notebook, james_garner).
actress(the_notebook, gena_rowlands).
actress(the_notebook, rachel_mcadams).
actor(the_notebook, ryan_gosling).

movie(prisoners, 2013).
director(prisoners, denis_villeneuve).
actor(prisoners, hugh_jackman).
actor(prisoners, jake_gyllenhaal).
actress(prisoners, viola_davis).

movie(the_intouchables, 2011).
director(the_intouchables, olivier_nakache). 
director(the_intouchables, eric_toledano).
actor(the_intouchables, francois_cluzet).
actor(the_intouchables, omar_sy).

released_after(M, Y) :- movie(M, MY), MY > Y.
released_before(M, Y) :- movie(M, MY), MY < Y.

q(1) :-
    !,
    writeln("Найти все фильмы вышедшие в каком году?"),
    read(Year),
    findall(Name, movie(Name, Year), List),
    writeln(List).

q(2) :-
    !,
    writeln("Найти все фильмы вышедшие после какого года?"),
    read(Year),
    findall(Name, released_after(Name, Year), List),
    writeln(List).

q(3) :-
    !,
    writeln("Найти все фильмы вышедшие до какого года?"),
    read(Year),
    findall(Name, released_before(Name, Year), List),
    writeln(List).

q(4) :-
    !,
    writeln("Найти всех актеров в каком фильме?"),
    read(Movie),
    findall(Actor, actor(Movie, Actor); actress(Movie, Actor), List),
    writeln(List).

q(5) :-
    !,
    writeln("Найти в скольки фильмах снялся какой актер?"),
    read(Actor),
    findall(Movie, actor(Movie, Actor); actress(Movie, Actor), List),
    writeln(List),
    length(List, Length),
    writeln(Length).
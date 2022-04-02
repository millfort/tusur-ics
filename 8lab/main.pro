:- dynamic fact/2.

rule(1,"еда","супы",[1, 3]).
rule(3,"еда","десерты",[1, 4]).
rule(2,"еда","вторые блюда",[1]).
rule(4,"еда","напитки",[2]).
rule(6,"супы","министроне",[5]).
rule(5,"супы","борщ",[6]).
rule(7,"вторые блюда","паста",[5]).
rule(8,"вторые блюда","пельмени ",[6]).
rule(9,"паста","карбонара",[6]).
rule(10,"паста","алио-олио",[14]).
rule(11,"десерты","мороженное",[7]).
rule(12,"десерты","тортик",[]).
rule(13,"напитки","натуральные напитки",[8]).
rule(15,"натуральные напитки","компот",[9]).
rule(16,"натуральные напитки","сок",[10, 11]).
rule(17,"напитки","кола",[13, 15]).
rule(18,"напитки","спрайт",[12]).


ask(X):- fact(X, 1),!.
ask(X):- fact(X, 0),!,fail.
ask(1):- write("оно используется для насыщения?"), !, complete(1).
ask(2):- write("оно используется для уталения жажды?"), !, complete(2).
ask(3):- write("оно состоит в основном из воды?"), !, complete(3).
ask(4):- write("оно сладкое?"), !, complete(4).
ask(5):- write("это блюдо итальянской кухни?"), !, complete(5).
ask(6):- write("в нем есть мясо?"), !, complete(6).
ask(7):- write("оно холодное?"), !, complete(7).
ask(8):- write("оно сделано из натуальных продуктов?"), !, complete(8).
ask(9):- write("его варят?"), !, complete(9).
ask(10):- write("оно сделано из фруктов и овощей?"), !, complete(10).
ask(11):- write("оно сделано отжимом?"), !, complete(11).
ask(12):- write("оно имеет преимущественно прозрачную текстуру?"), !, complete(12).
ask(13):- write("в нем множество цветочных ароматизаторов?"), !, complete(13).
ask(14):- write("оно содержит масло и чеснок?"), !, complete(14).
ask(15):- write("оно содержит жженый сахар?"), !, complete(15).


recognition(X):- rule(N, X, Y, Z), discover(Z), !,
    write("это "), write(X), write(" - "), write(Y), write(" по правилу "), write(N), nl,
    recognition(Y).
recognition("еда"):- write("эта еда мне неизвестна"),!.
recognition(_).

discover([]).
discover([X|Y]):- ask(X), discover(Y).

complete(X):- nl, read(Y), assert(fact(X, Y)), Y=1.

% ?- recognition("еда").
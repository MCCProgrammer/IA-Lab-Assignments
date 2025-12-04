house(1..5).
color(red;blue;white;orange;green).
man(miguel;joao;pedro;daniel;carlos).
club(academica;benfica;belenenses;fcporto;sporting).
drink(sumol;tea;coffee;milk;water).
woman(maria;carla;paula;filipa;ana).
pet(parrot;fox;turtle;horse;cat).
1 {has_color(H,C) : color(C)} 1 :- house(H).
1 {has_man(H,M) : man(M)} 1 :- house(H).
1 {has_club(H,C) : club(C)} 1 :- house(H).
1 {has_drink(H,D) : drink(D)} 1 :- house(H).
1 {has_woman(H,W) : woman(W)} 1 :- house(H).
1 {has_pet(H,P) : pet(P)} 1 :- house(H).
1 {has_color(H,C) : house(H)} 1 :- color(C).
1 {has_man(H,M) : house(H)} 1 :- man(M).
1 {has_club(H,C) : house(H)} 1 :- club(C).
1 {has_drink(H,D) : house(H)} 1 :- drink(D).
1 {has_woman(H,W) : house(H)} 1 :- woman(W).
1 {has_pet(H,P) : house(H)} 1 :- pet(P).
son(miguel,joao).
son(joao,pedro).
son(daniel,pedro).
son(carlos,daniel).
father(F,S) :- son(S,F).
grandfather(G,S) :- son(S,F), father(G,F).
next_to(H1,H2) :- house(H1), house(H2), H1 = H2+1.
next_to(H1,H2) :- house(H1), house(H2), H1 = H2-1.
right_of(H1,H2) :- house(H1), house(H2), H1 = H2+1.
lives_in(M,H) :- has_man(H,M).
lives_in_w(W,H) :- has_woman(H,W).
has_color(H,red) :- father(M,carlos), has_man(H,M).
has_pet(H,parrot) :- has_man(H,miguel), has_woman(H,W).
has_man(1,M) :- grandfather(M,carlos).
has_club(H,fcporto) :- has_color(H,orange).
has_fox_next(H1) :- has_club(H1,academica), has_pet(H2,fox), next_to(H1,H2).
:- has_club(H1,academica), not has_fox_next(H1).
has_blue_next(H1) :- has_man(H1,pedro), has_color(H2,blue), next_to(H1,H2).
:- has_man(H1,pedro), not has_blue_next(H1).
has_pet(H,turtle) :- has_club(H,sporting), has_woman(H,W).
has_drink(H,sumol) :- has_club(H,benfica).
has_drink(H,tea) :- father(M,miguel), has_man(H,M).
has_club(H,belenenses) :- son(S,daniel), has_man(H,S).
has_horse_house_next(H1) :- has_club(H1,fcporto), has_pet(H2,horse), has_woman(H2,W), next_to(H1,H2).
:- has_club(H1,fcporto), not has_horse_house_next(H1).
has_drink(H,coffee) :- has_color(H,green).
green_right_white(H1,H2) :- has_color(H1,green), has_color(H2,white), right_of(H1,H2).
:- has_color(H,green), not green_right_white(H,_).
:- has_color(H,white), not green_right_white(_,H).
has_drink(3,milk).
has_woman(H,ana) :- has_man(H,pedro).
:- has_man(H,carlos), has_woman(H,maria).
pref(miguel,paula,5). pref(miguel,ana,4). pref(miguel,maria,3). pref(miguel,carla,2). pref(miguel,filipa,1).
pref(maria,carlos,5). pref(maria,miguel,4). pref(maria,daniel,3). pref(maria,joao,2). pref(maria,pedro,1).
pref(joao,maria,5). pref(joao,paula,4). pref(joao,carla,3). pref(joao,filipa,2). pref(joao,ana,1).
pref(paula,daniel,5). pref(paula,carlos,4). pref(paula,joao,3). pref(paula,miguel,2). pref(paula,pedro,1).
pref(pedro,paula,5). pref(pedro,carla,4). pref(pedro,ana,3). pref(pedro,filipa,2). pref(pedro,maria,1).
pref(carla,miguel,5). pref(carla,daniel,4). pref(carla,joao,3). pref(carla,pedro,2). pref(carla,carlos,1).
pref(daniel,maria,5). pref(daniel,carla,4). pref(daniel,paula,3). pref(daniel,filipa,2). pref(daniel,ana,1).
pref(filipa,pedro,5). pref(filipa,joao,4). pref(filipa,daniel,3). pref(filipa,miguel,2). pref(filipa,carlos,1).
pref(carlos,ana,5). pref(carlos,carla,4). pref(carlos,paula,3). pref(carlos,maria,2). pref(carlos,filipa,1).
pref(ana,daniel,5). pref(ana,joao,4). pref(ana,pedro,3). pref(ana,carlos,2). pref(ana,miguel,1).
married(M,W) :- has_man(H,M), has_woman(H,W).
:- married(M,W1), married(M1,W), 
   pref(M,W,P1), pref(M,W1,P2), P1 > P2,
   pref(W,M,P3), pref(W,M1,P4), P3 > P4,
   man(M), woman(W), woman(W1), man(M1), M != M1, W != W1.
#show has_color/2.
#show has_man/2.
#show has_club/2.
#show has_drink/2.
#show has_woman/2.
#show has_pet/2.
#show married/2.

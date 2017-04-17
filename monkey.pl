domains
X=string
 
predicates
take(X,X)
move(X,X)
get_on(X,X)
hit(X,X,X)
 
go clauses
go:-
take("Monkey","Stick"),
move("Monkey","Chair"),
get_on("Monkey","Chair"),
hit("Monkey","Stick","Banana"),
write("The monkey has hit the banana").
 
go:-
write("The monkey couldn't reach the banana").
 
take(Animal,Object):-
write("Does the ",Animal," take the ",Object,"?(y/n)"),
readchar(Reply),
Reply='y'.
 
move(Animal,Object):-
write("Does the ",Animal," move the ",Object,"?(y/n)"),
readchar(Reply),
Reply='y'.
 
get_on(Animal,Object):-
write("Does the ",Animal," get on ",Object,"?(y/n)"),
readchar(Reply),
Reply='y'.
 
hit(Animal,Object,Fruit):-
write("Does the ",Animal," hit the ",Fruit,"with the",Object,"?(y/n)"),
readchar(Reply),
Reply='y'.
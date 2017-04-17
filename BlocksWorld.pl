/* Operators for the blocks world for simple planners using a
   strips-like notation.  Operators are defined by rules and have the
   form "operator(D,P,A,D) :- C." where 
     D: the operator description
     P: a list of preconditions that must be true to apply the operator
     A: a list of new facts to add to the state
     D: a list of facts to delete from the state
     C: a conjunction of constraints that must be true for the operator to be applied.
*/


/* putdown(X) - Assuming the hand is holding X, put it on the table
   and assert that the hand is empty, X is on the table, nothing is on
   X and retract the fact that the hand is holding X.  NOTE: X can not
   be the table.  
*/

operator(putdown(X), 
         [holding(X)],
         [ontable(X),handempty,clear(X)],
         [holding(X)]) 
  :- X\==table.


/* stack(X,Y) - Assuming that the hand holding X and nothing is on Y,
   stack X on top of Y, asserting that the hand is empty, X is on Y
   and nothing is on X and retract that we're holding X and that
   nothing is on Y.  Note that X and Y have to be different and that
   neither can be the table. 
 */


operator(stack(X,Y), 
         [holding(X),clear(Y)],
         [handempty,on(X,Y),clear(X)],
         [holding(X),clear(Y)]) 
  :- X\==Y,Y\==table,X\==table.



/* pickup(X) */
operator(pickup(X),
         [ontable(X), clear(X), handempty],
         [holding(X)],
         [ontable(X),clear(X),handempty]) 
  :- X\==table.


/* unstack(X,Y) */
operator(unstack(X,Y), 
         [on(X,Y), clear(X), handempty],
         [holding(X),clear(Y)],
         [handempty,clear(X),on(X,Y)]) 
  :- X\==Y,Y\==table,X\==table.



% turn off the warning for clauses not contiguous
:-style_check(-discontiguous).

%% some Blocks world test data -- intial states and goals to play with.
%% enter "test(strips, 3)" to call strips with initial_state 3 and goal state 3

init_state(1,[clear(a),clear(b),clear(c),ontable(a),ontable(b),ontable(c),handempty]).
goal(1,[on(a,b),on(b,c),ontable(c)]).

init_state(2,[clear(a),clear(b),clear(c),ontable(a),ontable(b),ontable(c),handempty]).
goal(2,[on(b,c),on(a,b),ontable(c) ]).

% susman anomaly
init_state(3,[clear(b),clear(c),ontable(a),ontable(b),on(c,a),handempty]).
goal(3,[on(a,b),on(b,c),ontable(c)]).

% Imposible goal
init_state(4,[clear(a),clear(b),ontable(a),ontable(b),handempty]).
goal(4,[on(a,b),on(b,a)]).

% invert a three tower
init_state(5,[clear(c),ontable(a),on(b,a),on(c,b),handempty]).
goal(5,[on(a,b),on(b,c),ontable(c)]).

% super trivial -- just pickup a
init_state(6,[clear(a),clear(b),clear(c),ontable(a),ontable(b),ontable(c),handempty]).
goal(6,[holding(a)]).

init_state(7,[clear(b), clear(c), ontable(b), ontable(a), on(c,a), handempty]).
goal(7,[on(a,b), on(b,c), ontable(c)]).

% impossible, of course.
init_state(8,[clear(a),clear(b),clear(c),ontable(a),ontable(b),ontable(c),handempty]).
goal(8,[on(b,c),on(c,a),on(a,b) ]).

init_state(9,[clear(b),on(b,a), on(a,d), on(d,c), ontable(c),handempty]).
goal(9,[on(a,b),ontable(b), on(c,d),ontable(d)]).

init_state(10,[clear(a),on(a, b), on(b,d), on(d,c), ontable(c),handempty]).
goal(10,[on(a,b),ontable(b), on(c,d),ontable(d),clear(a),clear(c)]).


init_state(11, [clear(a), clear(b), clear(c), ontable(a), ontable(b),
                ontable(c), handempty, ontable(paintSprayer(red)),
                ontable(paintSprayer(green)), ontable(paintSprayer(blue)),
                ontable(paintSprayer(white)), clear(paintSprayer(red)),
                clear(paintSprayer(green)), clear(paintSprayer(blue)),
                clear(paintSprayer(white))]).
goal(11, [on(a,b), color(a,red), color(b, blue)]).

init_state(12, [clear(a), clear(b), clear(c), ontable(a), ontable(b),
                ontable(c), handempty, ontable(paintSprayer(red)),
                ontable(paintSprayer(green)), ontable(paintSprayer(blue)),
                ontable(paintSprayer(white)), clear(paintSprayer(red)),
                clear(paintSprayer(green)), clear(paintSprayer(blue)),
                clear(paintSprayer(white))]).

goal(12, [color(a,red), color(b, blue), on(a,b)]).

init_state(13, [clear(a),color(a,blue), clear(b), clear(c), ontable(a), ontable(b),
                ontable(c), handempty, ontable(paintSprayer(red)),
                ontable(paintSprayer(green)), ontable(paintSprayer(blue)),
                ontable(paintSprayer(white)), clear(paintSprayer(red)),
                clear(paintSprayer(green)), clear(paintSprayer(blue)),
                clear(paintSprayer(white))]).

goal(13, [on(a,b),color(a,red)]).

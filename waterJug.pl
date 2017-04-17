domains
    x,y=integer.
predicates
    f(x,y).
clauses
    f(2,Y):-write("\n 2 0\n").
    f(X,2):-write("\n 0 2\n").

    f(X,Y):-Y=0,X<>4,!,
        write("\n ",X," 3"),
        f(X,3).

    f(X,Y):-X=0,Y<>3,!,
        write("\n 4 ",Y),
        f(4,Y).
            
    f(X,Y):-X+Y>=4,Y>0,X<>4,!,
        Y1=Y-4+X,
        write("\n 4 ",Y1),
        f(4,Y1);X+Y>=4,Y>0,Y<>3,!,
        Y1=Y-4+X,
        write("\n 4 ",Y1),
        f(4,Y1).
        
    f(X,Y):-X+Y>=3,X>0,X<>4,!,
        X1=X-3+Y,
        write("\n ",X1," 3"),
        f(X1,3);X+Y>=3,X>0,Y<>3,!,
        X1=X-3+Y,
        write("\n ",X1," 3"),
        f(X1,3).
        
    f(X,Y):-X+Y<=4,Y>0,!,
        X1=X+Y,
        write("\n ",X1," 0"),
        f(X1,0).
        
    f(X,Y):-X+Y<=3,X>0,!,
        Y1=X+Y,
        write("\n 0 ",Y1),
        f(0,Y1).
        
    f(X,Y):-X>0,!,
        write("\n 0 ",Y),
        f(0,Y).
        
    f(X,Y):-Y>0,!,
        write("\n ",X," 0"),
        f(X,0).
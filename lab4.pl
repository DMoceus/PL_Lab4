/*
David Morris
Eileen Head
Programming Languages -- Lab 4
Due: Saturday, February 21, 2015

1:
	A Homoiconic language is a language where the internal structure
	of a program can be inferred from the text's layout.

	Yes, Prolog is Homoiconic, since it's behavior is explicitly defined
	by the contents of the program.

	Source: http://en.wikipedia.org/wiki/Homoiconicity

	A language is Fully Reflective if structure and behavior of the program
	can be examined and modified at runtime.
	
	Source: http://en.wikipedia.org/wiki/Reflection_%28computer_programming%29
	
	Prolog is Fully Reflective by nature of being able to add rules during runtime.
*/

listOfTerms([],_,[]).
listOfTerms([H|T],Name,ListOfResults) :- X =.. [Name|H], listOfTerms(T,Name,Var), ListOfResults = [X|Var].

/*
5:
A BST is a Collection of Nodes originating from a Head node
Each node can have left and/or right children
Left children must be lesser than their parent,
Right Children must be greater than their parent
*/
isBST(T) :- isBST(T,_,_).
isBST(node(V,empty,empty),V,V).
isBST(node(V,L,empty),Min,Max) :-
	isBST(L,Lmin,Lmax),
	V > Lmax,
	Min = Lmin,
	Max = V.
isBST(node(V,empty,R),Min,Max) :-
	isBST(R,Rmin,Rmax),
	V < Rmin,
	Max = Rmax,
	Min = V.
isBST(node(V,L,R),Min,Max) :- 
	isBST(L,Lmin,Lmax),
	V > Lmax,
	Min = Lmin,
	isBST(R,Rmin,Rmax),
	V < Rmin,
	Max = Rmax.

insert(E,L1,L2) :- select(E,L2,L1).

applyList([]).
applyList([H|T]) :- H,applyList(T).

/*
10:
Because A is inside a not, it does not unify with anything. Therefore,
A unifies with B, and B unifies with what, so A unifies with what aswell
*/

convertToDecimal(A,0).  
convertToDecimal(succ(S), Y) :- numeral(S), Y1 is Y-1, convertToDecimal(S, Y1). 
numeral(0). 
numeral(succ(X)) :- numeral(X).

/*
11:
The execution of Y1 is Y-1 needs to happen after the recursive call to convertToDecimal,
otherwise the data will not be correctly written, and Y will always be 0.
*/






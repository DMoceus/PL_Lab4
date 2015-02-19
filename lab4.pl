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
A BST is a Collection of Nodes originating from a Head node
Each node can have left and/or right children
Left children must be lesser than their parent,
Right Children must be greater than their parent
*/
isBST(T) :- isBST(T,Min,Max).
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


%% 	Task 1
%
%	variance(+List, ?Variance)
%
%	True when Variance is variance of List.

variance( L, D ) :-
	mean_value( L, M ),
	variance( L, M, 0, D ).

variance( [], _, D, D ).
variance( [X|L], M, Tmp, D ) :-
	Tmp1 is Tmp+( X-M )**2,
	variance( L, M, Tmp1, D ).

%%	mean_value(+List, ?Mean)
%
%	True when Mean is mean value of List.

mean_value( [], 0 ).
mean_value( L, M ) :-
	length( L, Len ),
	sum_list( L, Sum ),
	M is Sum/Len.



%% 	Task 2
%	
%	max_sum(+List, ?Sum)
%
%	True when Sum is the greatest sum among all List subarrays.	

max_sum( [X|L], S ) :-
	max_sum( L, S, X, X ).

%	max_sum/4 MG represents global max. value found, ML local max, found in current iteration.

max_sum( [], S, S, _ ).
max_sum( [X|L], S, MG, ML ) :-
	( X < ML + X -> ML1 is ML + X; ML1 is X ),
	( ML1 < MG -> MG1 is MG; MG1 is ML1 ),
	max_sum( L, S, MG1, ML1 ).



%%	Task 3
%
%	even_permutation(+Xs, ?Ys)
%
%	True when Ys is an even permutation of Xs.
%
%	odd_permutation(+Xs, ?Ys)
%
%	True when Ys is an odd permutation of Xs.


%	Permutation of N elements is even iff 
%	(
%	permutation of N-1 elements is odd and Nth element is on even index;
%	permutation of N-1 elements is even and Nth element is on odd index
%	)

even_permutation( [X], [X] ).
even_permutation( [X|Xs], Ys ) :-
    (
    even_permutation( Xs, NewYs ),
    insert_odd( X, NewYs, Ys )
    );
    (
    odd_permutation( Xs, NewYs),
    insert_even( X, NewYs, Ys )
    ).

%	Permutation of N elements if odd iff
%	(
%	permutation of N-1 elements is odd and Nth element is on odd index;
%	permutation of N-1 elements is even and Nth element is on even index
%	)

odd_permutation( [X|Xs], Ys ) :-
    (
    odd_permutation( Xs, NewYs ),
    insert_odd( X, NewYs, Ys )
    );
    (
    even_permutation( Xs, NewYs ),
    insert_even( X, NewYs, Ys )
    ).

insert_odd( X, Xs, [X|Xs] ).
insert_odd( X, [Y,Z|Xs], [Y,Z|Ys] ) :-
    insert_odd( X, Xs, Ys ).

insert_even( X, [Y|Xs], [Y,X|Xs] ).
insert_even( X, [Y,Z|Xs], [Y,Z|Ys] ) :-
    insert_even( X, Xs, Ys ).




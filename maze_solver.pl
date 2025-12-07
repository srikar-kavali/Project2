find_exit(Maze, Actions) :-
    validate_maze(Maze),
    find_start(Maze, StartRow, StartCol),
    solve_maze(Maze, StartRow, StartCol, [], Actions).

validate_maze(Maze) :-
    Maze \= [],
    is_rectangular(Maze),
    count_starts(Maze, 1),
    count_exits(Maze, ExitCount),
    ExitCount > 0.

is_rectangular([]).
is_rectangualr([Row|Rows]) :-
    length(Row, Len),
    all_same_lengths(Rows, Len).

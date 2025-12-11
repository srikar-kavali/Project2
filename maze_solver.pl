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

count_starts(Maze, Count) :-
    flatten(Maze, Cells),
    count_cell(Cells, s, Count).

count_exits(Maze, Count) :-
    flatten(Maze, Cells),
    count_cell(Cells, e, Count).

count_cell([], _, 0).
count_cell([Cell|Rest], Cell, Count) :-
    !,
    count_cell(Rest, Cell, RestCount),
    Count is RestCount + 1.
count_cell([_|Rest], Cell, Count) :-
    count_cell(Rest, Cell, Count).

find_start(Maze, Row, Col) :-
    find_cell(Maze, s, 0, Row, Col).


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

find_cell([Row|_], Cell, RowIndex, RowIndex, ColIndex) :-
    find_in_row(Row, Cell, 0, ColIndex).
find_cell([_|Rows], Cell, CurrentRow, RowIndex, ColIndex) :-
    NextRow is CurrentRow + 1,
    find_cell(Rows, Cell, NextRow, RowIndex, ColIndex).

% Find cell in a specific row
find_in_row([Cell|_], Cell, ColIndex, ColIndex) :- !.
find_in_row([_|Cols], Cell, CurrentCol, ColIndex) :-
    NextCol is CurrentCol + 1,
    find_in_row(Cols, Cell, NextCol, ColIndex).

solve_maze(Maze, Row, Col, _, []) :-
    get_cell(Maze, Row, Col, e).  % Reached exit

solve_maze(Maze, Row, Col, Visited, [Action|RestActions]) :-
    \+ member((Row, Col), Visited),  % Not visited this cell yet
    get_cell(Maze, Row, Col, Cell),
    (Cell = s ; Cell = f ; Cell = e),  % Valid cell to be on
    move(Action, Row, Col, NewRow, NewCol),
    in_bounds(Maze, NewRow, NewCol),
    get_cell(Maze, NewRow, NewCol, NewCell),
    NewCell \= w,  % Can't move into wall
    solve_maze(Maze, NewRow, NewCol, [(Row, Col)|Visited], RestActions).

% Get cell value at position
get_cell(Maze, Row, Col, Cell) :-
    nth0(Row, Maze, RowList),
    nth0(Col, RowList, Cell).

% Check if position is within maze bounds
in_bounds(Maze, Row, Col) :-
    Row >= 0,
    Col >= 0,
    length(Maze, NumRows),
    Row < NumRows,
    Maze = [FirstRow|_],
    length(FirstRow, NumCols),
    Col < NumCols.

% Define movement actions
move(up, Row, Col, NewRow, Col) :-
    NewRow is Row - 1.
move(down, Row, Col, NewRow, Col) :-
    NewRow is Row + 1.
move(left, Row, Col, Row, NewCol) :-
    NewCol is Col - 1.
move(right, Row, Col, Row, NewCol) :-
    NewCol is Col + 1.
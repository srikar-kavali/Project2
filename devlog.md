Development Log

December, 6th 2025 10:54 pm - Initial thoughts and setup

Thoughts so far
Starting Project 2. This is my first Prolog project, so I need to review and understand Prolog's logic programming paradigms and how it is different from other impoerative languages. 

Key Requirements:
- Main Predicate: find_exit/2 where the first parameter is the maze and the second is a list of actions
- The Maze is a list of rows, where each row is a list of cells (f, w, s, e)
- The Actions are left, right, up, down
- You have to validate the maze. There must be one start, and at least one exit

Challenging parts:
- Properly using unification and backtracking
- Avoiding infinite loops in the pathfinding
- Making sure validation happens before solving

Plan
- Set up git repo and initial devlog
- Study example files to understand maze format
- Create basic file structure
- Start with maze validation predicates
  
December, 7th 2025 11:30 pm - Finishing up first functions and planning next stepa

I completed 3 functions, specifically functions for findng the exit of the maze, validating the maze, and making sure the maze is a rectangle. 
I only completed functions which are essentially checks for if the maze is a valid maze. I still need to work on logic and other aspects of the
project.

My next steps are going to be complete functions for finding the start position, counting number of starts and exits, and the function to check that number of rows and columns are the same.


### Step 1: Understand the Problem
 - Implement a game of Tic-Tac-Toe with 2 players 
 - Game will be played from the command line. 
 - Players will alternate turns.

### Step 2: Pseudocode the High Level Approach
```
Set up the game initially
    Create a game board
    Create a couple players
Start the game loop
    Render the board
    Ask for and validate the current player's coordinates
    If the game should end
        Display the proper victory / draw message
        Stop looping
    Else
        Switch to the next player and keep looping
```


### Step 3: Assign Actions to Objects
- Here, actions are classes and objects belong to said classes.

```
# initialize a game of TicTacToe
Set up the game initially [TicTacToe] 

    # initialize a game Board
    Create a game board [Board]
    
    # initialize Players
    Create a couple players [Player] 
    
# loop through gameplay, until Board is full? || until 3 in a row?
Start the game loop [TicTacToe] 

    # how the user see the board in the terminal
    Render the board [Board] 
    
    # Player makes a move
    Ask for and validate the current player's coordinates [Player] 
    
    # conditions for win/loss/end game
    If the game should end [TicTacToe] 
        Display the proper victory / draw message
        Stop looping
    Else
        # switch players continue gameplay
        Switch to the next player and keep looping [TicTacToe]
```
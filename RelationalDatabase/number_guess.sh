#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"

# ~~~~~ WELCOME THE USER ~~~~~
echo "Enter your username:"
read USERNAME
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username LIKE '$USERNAME';")
if [[ -z $USER_ID ]] # if username isn't found
then
  USER_INSERT_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME');")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username LIKE '$USERNAME';")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id=$USER_ID;")
  GAMES_PLAYED=$(echo $GAMES_PLAYED | sed -r 's/^ *| *$//g')
  BEST_GAME_GUESSES=$($PSQL "SELECT MIN(num_guesses) FROM games WHERE user_id=$USER_ID;")
  BEST_GAME_GUESSES=$(echo $BEST_GAME_GUESSES | sed -r 's/^ *| *$//g')
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME_GUESSES guesses."
fi
USER_ID=$(echo $USER_ID | sed -r 's/^ *| *$//g')

# ~~~~~ PLAY THE GAME ~~~~~
GUESS=0
NUM_GUESSES=0
ANSWER=$((1 + $RANDOM % 1000))
while [[ ! $GUESS = $ANSWER ]]
do
  if [[ ! $GUESS =~ ^[0-9]+$ ]] # check if guess is (not) a number
  then
    echo "That is not an integer, guess again:"
    read GUESS
  elif [[ $GUESS = 0 ]]
  then
    echo "Guess the secret number between 1 and 1000:"
    read GUESS
  elif [[ $GUESS > $ANSWER ]]
  then
    echo "It's lower than that, guess again:"
    read GUESS
  else [[ $GUESS < $ANSWER ]]
    echo "It's higher than that, guess again:"
    read GUESS
  fi
  NUM_GUESSES=$(($NUM_GUESSES+1))
done

# ~~~~~ FINISH THE GAME ~~~~~
echo "You guessed it in $NUM_GUESSES tries. The secret number was $ANSWER. Nice job!"
GAME_INSERT_RESULT=$($PSQL "INSERT INTO games(user_id,correct_answer,num_guesses) VALUES($USER_ID,'$ANSWER','$NUM_GUESSES');")

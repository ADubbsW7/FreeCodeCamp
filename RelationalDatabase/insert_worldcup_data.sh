#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $WINNER != "winner" ]] # skip the first row
  then
    # --------- Insert into teams table ---------
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'") # get the team_id of the winner
    if [[ -z $WINNER_ID ]] # if the team_id isn't found
    then
      INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')") # insert the team into the teams table
      if [[ $INSERT_WINNER_RESULT == "INSERT 0 1" ]] # check if it was inserted correctly
      then
        echo Inserted into teams, $WINNER # print what team was inserted
      fi
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'") # get the newly inserted team's team_id
    fi

    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'") # get the team_id of the winner
    if [[ -z $OPPONENT_ID ]] # if the team_id isn't found
    then
      INSERT_OPPONENT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')") # insert the team into the teams table
      if [[ $INSERT_OPPONENT_RESULT == "INSERT 0 1" ]] # check if it was inserted correctly
      then
        echo Inserted into teams, $OPPONENT # print what team was inserted
      fi
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'") # get the newly inserted team's team_id
    fi
    # --------- Insert into games table ---------
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($YEAR,'$ROUND',$WINNER_ID,$OPPONENT_ID,$WINNER_GOALS,$OPPONENT_GOALS)")
    if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
    then
      echo Inserted into games, The $ROUND game of the $YEAR World Cup between $WINNER and $OPPONENT
    fi
  fi
done

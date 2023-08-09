#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
  echo $($PSQL "TRUNCATE teams, games")

  declare -A TEAM_IDS

  cat games.csv | while IFS="," read  YEAR ROUND WINNER OPPONENT_WINNER WINNER_GOALS OPPONENT_GOALS
  do
    if [[ $YEAR != 'year' ]]
    then

      # if not then add winner
      if [[ ${TEAM_IDS[$WINNER]} ]]
      then
        WINNER_ID=${TEAM_IDS[$WINNER]}
      else
        INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
        if [[ $INSERT_WINNER_RESULT == "INSERT 0 1" ]]
        then
          echo Inserted into teams $WINNER
        fi
        TEAM_IDS[$WINNER]=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
        # get winner_id
        WINNER_ID=${TEAM_IDS[$WINNER]}
      fi



      # if not then add opponent
      if [[ ${TEAM_IDS[$OPPONENT_WINNER]} ]]
      then
        OPPONENT_WINNER_ID=${TEAM_IDS[$OPPONENT_WINNER]}
      else
        INSERT_OPPONENT_WINNER_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT_WINNER')")
        if [[ $INSERT_OPPONENT_WINNER_RESULT == "INSERT 0 1" ]]
        then
          echo Inserted into teams $OPPONENT_WINNER
        fi
        TEAM_IDS[$OPPONENT_WINNER]=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT_WINNER'")
        OPPONENT_WINNER_ID=${TEAM_IDS[$OPPONENT_WINNER]}
      fi

      INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, winner_goals, opponent_id, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $WINNER_GOALS, $OPPONENT_WINNER_ID, $OPPONENT_GOALS)")
      if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted game $WINNER VS $OPPONENT_WINNER in $ROUND of year $YEAR
      fi
    fi
  done
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
  echo $($PSQL "TRUNCATE teams, games")

  declare -A TEAM_IDS

  cat games.csv | while IFS="," read  YEAR ROUND WINNER OPPONENT_WINNER WINNER_GOALS OPPONENT_GOALS
  do
    if [[ $YEAR != 'year' ]]
    then

      # if not then add winner
      if [[ ${TEAM_IDS[$WINNER]} ]]
      then
        WINNER_ID=${TEAM_IDS[$WINNER]}
      else
        INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
        if [[ $INSERT_WINNER_RESULT == "INSERT 0 1" ]]
        then
          echo Inserted into teams $WINNER
        fi
        TEAM_IDS[$WINNER]=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
        # get winner_id
        WINNER_ID=${TEAM_IDS[$WINNER]}
      fi



      # if not then add opponent
      if [[ ${TEAM_IDS[$OPPONENT_WINNER]} ]]
      then
        OPPONENT_WINNER_ID=${TEAM_IDS[$OPPONENT_WINNER]}
      else
        INSERT_OPPONENT_WINNER_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT_WINNER')")
        if [[ $INSERT_OPPONENT_WINNER_RESULT == "INSERT 0 1" ]]
        then
          echo Inserted into teams $OPPONENT_WINNER
        fi
        TEAM_IDS[$OPPONENT_WINNER]=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT_WINNER'")
        OPPONENT_WINNER_ID=${TEAM_IDS[$OPPONENT_WINNER]}
      fi

      INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, winner_goals, opponent_id, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $WINNER_GOALS, $OPPONENT_WINNER_ID, $OPPONENT_GOALS)")
      if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted game $WINNER VS $OPPONENT_WINNER in $ROUND of year $YEAR
      fi
    fi
  done
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

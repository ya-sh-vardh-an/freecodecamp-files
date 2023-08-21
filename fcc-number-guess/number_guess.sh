#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess_game -t --no-align -c"

echo -e "\n~~~~WELCOME to Number Guessing Game~~~~\n"

echo "Enter your username:"
read USERNAME
USER_ID=$($PSQL "SELECT user_id FROM users WHERE name='$USERNAME';")

if [[ -z $USER_ID ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_USERNAME_RESULT=$($PSQL "INSERT INTO users(name) VALUES('$USERNAME')")
  GAMES_PLAYED=0
  BEST_SCORE="No Score"
  if [[ $INSERT_USERNAME_RESULT == 'INSERT 0 1' ]]
  then
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE name='$USERNAME';")
  fi
else
  SCOREBOARD=$($PSQL "SELECT games_played, best_score FROM scoreboard WHERE user_id=$USER_ID")
  IFS='|' read -r GAMES_PLAYED BEST_SCORE <<< $SCOREBOARD
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_SCORE guesses."
fi

NUMBER=$(( $RANDOM % 1000 ))
NUMBER_OF_GUESSES=0

CONSOLE() {
  if [[ $1 ]]
  then
    echo $1
  else
    echo "Guess the secret number between 1 and 1000:"
  fi
  read GUESS

  # guess is not a number
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    # ask again to guess a number
    NUMBER_OF_GUESSES=$(( $NUMBER_OF_GUESSES+1 ))
    CONSOLE "That is not an integer, guess again:"
  else
    # the guess is the number
    if (( $GUESS == $NUMBER ))
    then
      NUMBER_OF_GUESSES=$(( $NUMBER_OF_GUESSES+1 ))
      GAMES_PLAYED=$(( $GAMES_PLAYED+1 ))
      if [[ $BEST_SCORE == "No Score" ]]
      then
        # when the entry is new
        INSERT_SCORE_RESULT=$($PSQL "INSERT INTO scoreboard(games_played, best_score, user_id) VALUES($GAMES_PLAYED, $NUMBER_OF_GUESSES, $USER_ID)")
      else
        if (( $BEST_SCORE > $NUMBER_OF_GUESSES ))
        then
          # also adds the new bestScore
          UPDATE_BESTSCORE_RESULT=$($PSQL "UPDATE scoreboard SET games_played = $GAMES_PLAYED, best_score = $NUMBER_OF_GUESSES WHERE user_id = $USER_ID;")
        else
          # only update the "games"
          UPDATE_GAMES_RESULT=$($PSQL "UPDATE scoreboard SET games_played = $GAMES_PLAYED WHERE user_id = $USER_ID")
        fi
      fi
      echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $NUMBER. Nice job!"
    elif (( $GUESS > $NUMBER ))
    then
      NUMBER_OF_GUESSES=$(( $NUMBER_OF_GUESSES+1 ))
      CONSOLE "It's lower than that, guess again:"
    elif (( $GUESS < $NUMBER ))
    then
      NUMBER_OF_GUESSES=$(( $NUMBER_OF_GUESSES+1 ))
      CONSOLE "It's higher than that, guess again:"
    fi
  fi
}

CONSOLE
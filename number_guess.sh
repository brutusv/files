#!/bin/bash

echo "Enter your username:"
read USER_NAME

PSQL="psql --username=freecodecamp --dbname=number_guess -t -F"," --no-align -c"
# QUERY_USER_RESULT=$($PSQL "SELECT name, number_of_attemps FROM users LEFT JOIN games ON users.user_id=games.user_id WHERE users.name='$USER_NAME';")
QUERY_USER_RESULT=$($PSQL "SELECT name, COUNT(number_of_attemps), MIN(number_of_attemps) FROM users LEFT JOIN games ON users.user_id=games.user_id WHERE users.name='$USER_NAME' GROUP BY users.name;")
# echo "QUERY_USER_RESULT = '$QUERY_USER_RESULT'"
if [[ -z $QUERY_USER_RESULT ]]; then
  echo "Welcome, $USER_NAME! It looks like this is your first time here."
  # save user to database
  ADD_USER_RESULT=$($PSQL "INSERT INTO users(name) VALUES('$USER_NAME');")
  # request user_id
else
  OIFS=$IFS 
  IFS=',' 
  read -r USER_NAME GAMES_PLAYED BEST_GAME <<< "$QUERY_USER_RESULT" 
  IFS=$OIFS
  echo "Welcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi
  
NUMBER=$(( $RANDOM % 1000 + 1 ))
# echo "NUMBER = $NUMBER"
COUNTER=0
GUESS_NUMBER=-1
echo "Guess the secret number between 1 and 1000:"  
while [ $GUESS_NUMBER -ne $NUMBER ] 
do
  read GUESS_NUMBER
  # echo "GUESS_NUMBER = $GUESS_NUMBER"
  # echo "COUNTER = $COUNTER"

  if [[ "$GUESS_NUMBER" =~ [0-9] ]];
  then
    if [ $GUESS_NUMBER -gt $NUMBER ];
    then
      echo "It's lower than that, guess again:"
    elif [ $GUESS_NUMBER -lt $NUMBER ];
    then
      echo "It's higher than that, guess again:"
    fi    
  else
    echo "That is not an integer, guess again:"
    GUESS_NUMBER=-1
  fi
  COUNTER=$((COUNTER + 1))
done
# writing results to db
USER_ID=$($PSQL "SELECT user_id FROM users WHERE users.name='$USER_NAME';")
# echo "USER_ID = $USER_ID"
ADD_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, number_of_attemps) VALUES($USER_ID, $COUNTER);")
echo "You guessed it in $COUNTER tries. The secret number was $NUMBER. Nice job!"
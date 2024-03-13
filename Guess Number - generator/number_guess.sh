#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

is_integer() {
    if [[ $1 =~ ^[0-9]+$ ]]; then
        return 0  # It's an integer
    else
        return 1  # It's not an integer
    fi
}

GUESS_GAME(){

echo -e "\nEnter your username:"
read USERNAME

FOUND_USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

if [[ -z $FOUND_USER_ID ]]
then
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
else
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE user_id='$FOUND_USER_ID'")
  BEST_GAME=$($PSQL "SELECT MIN(best_game) FROM users WHERE user_id='$FOUND_USER_ID'")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

SECRET_NUMBER=$($PSQL "SELECT FLOOR(RANDOM() * (1000 - 1 + 1)) + 1 AS RandomNumber;")
echo -e "\nGuess the secret number between 1 and 1000:"
read ANSWER

# Validate if the input is an integer
    while ! is_integer "$ANSWER"; do
        echo "That is not an integer, guess again:"
        read ANSWER
    done

COUNTER=1
# Define the while loop
while [ $SECRET_NUMBER -ne $ANSWER ]; do
    echo "Counter: $COUNTER"
    echo "SECRET_NUMBER: $SECRET_NUMBER"
    if [[ $SECRET_NUMBER -gt $ANSWER ]]
    then
      echo -e "\nIt's higher than that, guess again:"
      ((COUNTER++))
    elif [[ $SECRET_NUMBER -lt $ANSWER ]]
      then
      echo -e "\nIt's lower than that, guess again:"
      ((COUNTER++))
    fi
    read ANSWER
    # Validate if the input is an integer
    while ! is_integer "$ANSWER"; do
        echo "That is not an integer, guess again:"
        read ANSWER
    done
done

#Update result
if [[ -z $FOUND_USER_ID ]]
then
  ADD_USER_DATA=$($PSQL "INSERT INTO users(username,games_played,best_game) VALUES('$USERNAME', 1, '$COUNTER')")
  else
  UPDATE_USER_GAME_COUNT=$($PSQL "UPDATE users SET games_played=(($GAMES_PLAYED +1)) WHERE username ='$USERNAME'")
  if [[ $BEST_GAME > $COUNTER ]]
  then 
  UPDATE_USER_BEST_GAME=$($PSQL "UPDATE users SET best_game='$COUNTER' WHERE username='$USERNAME'")
  echo -e "\nNew Highscore!"
  fi
fi
((COUNTER++))
echo "You guessed it in $COUNTER tries. The secret number was $SECRET_NUMBER. Nice job!"

}

GUESS_GAME
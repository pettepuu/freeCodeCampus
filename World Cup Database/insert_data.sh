#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.


echo $($PSQL "TRUNCATE TABLE teams, games")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS

do
if [[ $YEAR != "year" ]]
then
#get team_id
WTEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
#if not found
if [[ -z $WTEAM_ID ]]
    then
    INSERT_WINNERTEAM=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_WINNERTEAM == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $INSERT_WINNERTEAM
      fi
    fi

LTEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
if [[ -z $LTEAM_ID ]]
    then
    INSERT_LOSTTEAM=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_LOSTTEAM == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $INSERT_LOSTTEAM
      fi
    fi
fi
done



cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
    WTEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    LTEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    if [[ $YEAR != "year" ]]
    then
        INSERT_RESULT=$($PSQL "INSERT INTO games(year, round, winner_goals, opponent_goals, winner_id, opponent_id) VALUES($YEAR, '$ROUND', $WINNER_GOALS, $OPPONENT_GOALS, $WTEAM_ID, $LTEAM_ID)")

        if [[ $INSERT_RESULT == "INSERT 0 1" ]]
        then
            echo Inserted into games
        fi
    fi
done

#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi
echo $($PSQL "TRUNCATE teams, games")
# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
if [[ $WINNER != winner && $OPPONENT != opponent ]]
then
myteams_array=("$WINNER" "$OPPONENT")
for team in "${myteams_array[@]}"
do
TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$team'")
#if not found
if [[ -z $TEAM_ID ]]
then
#insert team
INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams (name) VALUES ('$team')")
if [[ $INSERT_TEAM_RESULT == 'INSERT 0 1' ]]
then
echo Inserted into teams, $team
fi
fi
done
WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
INSERT_GAME_RESULT=$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
if [[ $INSERT_TEAM_RESULT == 'INSERT 0 1' ]]
then
echo Inserted into games, $ROUND $YEAR
fi
fi
done

#!/bin/bash

RANDOM_NUMBER=$((RANDOM % 1000 + 1))

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
echo -e "Enter your username: "

guess_number() {
	read number
	while [[ ! $number =~ ^[0-9]+$ ]]
	do
		echo "That is not an integer, guess again: "
		read number
	done
}
read username

user=$($PSQL "SELECT * FROM users WHERE username = '$username'")
if [[ -z $user ]]; then
        echo "Welcome, $username! It looks like this is your first time here."
	newuser=$($PSQL "INSERT INTO users (username, games_played) VALUES ('$username', 1) RETURNING user_id")
        user_id=$(echo $newuser | cut -d' ' -f1)
fi
if [[ -n $user ]]; then
        IFS='|' read -r user_id username games_played <<< $user
	best_game=$($PSQL "SELECT MIN(guess) FROM guesses WHERE user_id = $user_id")
	echo "Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."
fi

echo "Guess the secret number between 1 and 1000: "
guess_number
guesses=1

number_guesser() {
	until [ $number -eq $RANDOM_NUMBER ]; do
    		if [[ $number -lt $RANDOM_NUMBER ]]; then
            		echo "It's lower than that, guess again:"
    		elif [[ $number -gt $RANDOM_NUMBER ]]; then
            		echo "It's higher than that, guess again:"
    		fi
    		guess_number
    		((guesses++))
	done
}

number_guesser

until [ $number -eq $RANDOM_NUMBER ]; do
    if [[ $number -lt $RANDOM_NUMBER ]]; then
            echo "It's lower than that, guess again:"
    elif [[ $number -gt $RANDOM_NUMBER ]]; then
            echo "It's higher than that, guess again:"
    fi
    guess_number
    ((guesses++))
done
new_guess=$($PSQL "INSERT INTO guesses (user_id, guess) VALUES ($user_id, $guesses)")
echo "You guessed it in $guesses tries. The secret number was $RANDOM_NUMBER. Nice job!"

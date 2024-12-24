#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [ $# -lt 1 ]; then
    echo "Please provide an element as an argument."
elif [ $# -gt 1 ]; then
    echo "Incorrect number of arguments. Only one argument is required."
else
    if [[ $1 =~ ^[0-9]+$ ]]; then
	    ELEMENT=$($PSQL "SELECT e.atomic_number, e.symbol, e.name, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius, t.type FROM elements e JOIN properties p ON e.atomic_number = p.atomic_number JOIN types t ON p.type_id = t.type_id WHERE e.atomic_number = $1")
    else
	    ELEMENT=$($PSQL "SELECT e.atomic_number, e.symbol, e.name, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius, t.type FROM elements e JOIN properties p ON e.atomic_number = p.atomic_number JOIN types t ON p.type_id = t.type_id WHERE e.symbol = '$1' OR e.name = '$1'")
    fi
    if [[ -z $ELEMENT ]]; then
	    echo "I could not find that element in the database."
    else
	    IFS='|' read -r atomic_number symbol name atomic_mass melting_point boiling_point state <<< "$ELEMENT"

	    echo "The element with atomic number $atomic_number is $name ($symbol). It's a $state, with a mass of $atomic_mass amu. $name has a melting point of $melting_point celsius and a boiling point of $boiling_point celsius."
    fi
fi


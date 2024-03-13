#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --tuples-only -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
fi

#if argument is atomic number 
if [[ $1 =~ ^[1-9]+$ ]]
then
  ELEMENT=$($PSQL "select atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius from elements join properties using(atomic_number) join types using(type_id) where atomic_number = '$1'")
else
#if argument is string
  ELEMENT=$($PSQL "select atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius from elements join properties using(atomic_number) join types using(type_id) where name = '$1' or symbol = '$1'")
fi

#element not in db
if [[ -z $ELEMENT ]]
then
  echo "I could not find that element in the database."
fi

echo $ELEMENT | while IFS=" |" read AN NAME SYMBOL TYPE MASS MELTING_POINT BOILING_POINT 
do
  echo "The element with atomic number $AN is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $name has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
done

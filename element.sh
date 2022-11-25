#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table -c --tuples-only --no-align" 

if [[ $1 ]]
then
if [[ $1 =~ ^[0-9]+$ ]]
then
atomic_number=$1
name="$($PSQL "SELECT name FROM elements WHERE atomic_number = $atomic_number")"
symbol="$($PSQL "SELECT symbol FROM elements WHERE atomic_number = $atomic_number")"
atomic_mass="$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = $atomic_number")"
melting_point_celsius="$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = $atomic_number")"
boiling_point_celsius="$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = $atomic_number")"
type="$($PSQL "SELECT type FROM properties full join types using(type_id) WHERE atomic_number = $atomic_number")"
echo The element with atomic number $atomic_number is $name \("$symbol"\). It\'s a $type, with a mass of $atomic_mass amu. $name has a melting point of $melting_point_celsius celsius and a boiling point of $boiling_point_celsius celsius.
fi
else
echo "Please provide an element as an argument."
fi
#!/bin/bash
if [ "$#" -eq 0 ] 
then
    echo "Please provide an element as an argument.";
else
  PSQL="psql --username=freecodecamp --dbname=periodic_table -t -A -F"," --no-align -c"
  if [[ "$1" =~  ^[0-9]{1,3}$ ]];
  then
    SELECT_RESULT=$($PSQL "SELECT elements.atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements LEFT JOIN properties ON elements.atomic_number=properties.atomic_number LEFT JOIN types ON properties.type_id=types.type_id WHERE elements.atomic_number=$1;")
    if [[ -z $SELECT_RESULT ]]; then
      echo "I could not find that element in the database."
    fi
    $PSQL "SELECT elements.atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements LEFT JOIN properties ON elements.atomic_number=properties.atomic_number LEFT JOIN types ON properties.type_id=types.type_id WHERE elements.atomic_number=$1;" | while IFS="," read -r ATOMIC_NUMBER SYMBOL NAME TYPE ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
    done
  elif [[ "$1" =~  ^[a-zA-Z]{1,2}$ ]];
  then
    SELECT_RESULT=$($PSQL "SELECT elements.atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements LEFT JOIN properties ON elements.atomic_number=properties.atomic_number LEFT JOIN types ON properties.type_id=types.type_id WHERE elements.symbol='$1';")
    if [[ -z $SELECT_RESULT ]]; then
      echo "I could not find that element in the database."
    fi
    $PSQL "SELECT elements.atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements LEFT JOIN properties ON elements.atomic_number=properties.atomic_number LEFT JOIN types ON properties.type_id=types.type_id WHERE elements.symbol='$1';" | while IFS="," read -r ATOMIC_NUMBER SYMBOL NAME TYPE ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
    done
  else
    SELECT_RESULT=$($PSQL "SELECT elements.atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements LEFT JOIN properties ON elements.atomic_number=properties.atomic_number LEFT JOIN types ON properties.type_id=types.type_id WHERE elements.name='$1';")
    if [[ -z $SELECT_RESULT ]]; then
      echo "I could not find that element in the database."
    fi  
    $PSQL "SELECT elements.atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements LEFT JOIN properties ON elements.atomic_number=properties.atomic_number LEFT JOIN types ON properties.type_id=types.type_id WHERE elements.name='$1';" | while IFS="," read -r ATOMIC_NUMBER SYMBOL NAME TYPE ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
    done
  fi
fi
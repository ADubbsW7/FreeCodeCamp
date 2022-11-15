#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ -z $1 ]] # if no argument is provided
then
  echo "Please provide an element as an argument."
else
  if [[ $1 =~ ^[0-9]+$ ]] # if the input is a number
  then
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$1;")
  else
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol LIKE '$1' OR name LIKE '$1';")
  fi
  #echo -e "\n$ATOMIC_NUMBER"
  if [[ -z $ATOMIC_NUMBER ]] # if the element can't be found in the table
  then
    echo "I could not find that element in the database."
  else
    ELEMENT_RAW_DATA=$($PSQL "SELECT * FROM elements LEFT JOIN properties USING (atomic_number) LEFT JOIN types USING(type_id) WHERE elements.atomic_number=$ATOMIC_NUMBER;")
    #echo -e "\n$ELEMENT_RAW_DATA"
    IFS='|' read -r -a ELEMENT_DATA <<< $ELEMENT_RAW_DATA # split the element data into an array
    # echo -e "\n...$(echo ${ELEMENT_DATA[3]} | sed -r 's/^ *| *$//g')..."
    for i in ${!ELEMENT_DATA[@]}; #remove leading & trailing spaces for each element in the array
    do
      ELEMENT_DATA[i]=$(echo ${ELEMENT_DATA[i]} | sed -r 's/^ *| *$//g')
    done
    echo "The element with atomic number ${ELEMENT_DATA[1]} is ${ELEMENT_DATA[3]} (${ELEMENT_DATA[2]}). It's a ${ELEMENT_DATA[7]}, with a mass of ${ELEMENT_DATA[4]} amu. ${ELEMENT_DATA[3]} has a melting point of ${ELEMENT_DATA[5]} celsius and a boiling point of ${ELEMENT_DATA[6]} celsius."
  fi
fi

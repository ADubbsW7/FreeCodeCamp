#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

SERVICE_MENU() { # print the available services
  SERVICES=$($PSQL "SELECT service_id, name FROM services;") #get the available services
  echo "$SERVICES" | while read SERVICE_ID BAR NAME #then print them out one by one
  do
    echo "$SERVICE_ID) $NAME" #formatting them like so: #) name
  done  
  echo -e "\nPlease select a service (by number)"
}

echo -e "\n~~~~~~~~ Salon Services ~~~~~~~~"
# determine which service the customer wants
SERVICE_MENU # print the available services
read SERVICE_ID_SELECTED
SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id='$SERVICE_ID_SELECTED';")
until [[ ! -z $SERVICE_NAME ]] # if the picked something that isn't available (variable will be empty if it isn't found in db above)
do
  echo -e "\n\n~~~~~~~~ Salon Services ~~~~~~~~"
  SERVICE_MENU # print the available services
  read SERVICE_ID_SELECTED
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id='$SERVICE_ID_SELECTED';")
done

# determine what customer wants to make the appointment
echo -e "\nUnder what phone number would you like to reserve that service?"
read CUSTOMER_PHONE
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';") # get the customer's ID based on the inputted phone number
if [[ -z $CUSTOMER_ID ]] # if customer isn't found
then
  echo -e "\nIt looks like you are a new customer. What is your name?"
  read CUSTOMER_NAME
  CUSTOMER_INSERTED=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE');")
  if [[ $CUSTOMER_INSERTED == 'INSERT 0 1' ]]
  then
    echo -e "\nWelcome $CUSTOMER_NAME."
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")
  fi
else # get the customer's name
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id=$CUSTOMER_ID;")
fi

# make the appointment
echo "What time would you like to schedule your $(echo $SERVICE_NAME | sed -r 's/^ *//g')?"
read SERVICE_TIME
APPOINTMENT_INSERTED=$($PSQL "INSERT INTO appointments(service_id,customer_id,time) VALUES($SERVICE_ID_SELECTED,$CUSTOMER_ID,'$SERVICE_TIME');")
if [[ $APPOINTMENT_INSERTED == 'INSERT 0 1' ]]
then
  echo -e "I have put you down for a $(echo $SERVICE_NAME | sed -r 's/^ *//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *//g')."
fi

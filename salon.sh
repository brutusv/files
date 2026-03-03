#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=salon -t -A -F"," --no-align -c"
SERVICE_LIST () {
  echo "Please enter number of service you want: "
  $PSQL "SELECT service_id, name FROM services" | while IFS="," read -r SERVICE_ID NAME
  do
    echo "$SERVICE_ID) $NAME"
  done

  read SERVICE_ID_SELECTED
  check if choise exists
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED;")
  if [[ -z $SERVICE_NAME ]]
  then
    SERVICE_LIST
  else
    echo "Please enter your phone number:"
    read CUSTOMER_PHONE
    # check phone is in db
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")
    echo "customer_id from Database = $CUSTOMER_ID"
    if [[ -z $CUSTOMER_ID ]]
    then
      echo "No such customer"
      echo "Please enter your name:"
      read CUSTOMER_NAME
      ADD_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE');")
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")
    else
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id=$CUSTOMER_ID;")
    fi
    echo "Please enter time your want:"
    read SERVICE_TIME
    ADD_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$SERVICE_TIME', $CUSTOMER_ID, $SERVICE_ID_SELECTED);")
    echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}

SERVICE_LIST
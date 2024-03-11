#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon -t --no-align -c"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi


AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services")
if [[ -z $AVAILABLE_SERVICES ]]
then
  MAIN_MENU "At the moment, there is no services available."
else
echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID $NAME" | sed 's/|/) /'
  done

  echo -e "\nIs there any service you would like to order?"
  read SERVICE_ID_SELECTED

  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-3]+$ ]]
  then
    MAIN_MENU "That is not a valid service number."

    else
    echo -e "\nWHAT is your phone number?"
    read CUSTOMER_PHONE
    echo -e "\nWhat time would suit you best?"
    read SERVICE_TIME

    # Phone number doesn't exist in our system
      C_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
      echo "CUSTOMER ID: $C_ID" # Debugging statement

      if [[ -z "$C_ID" ]] 
      then
      echo -e "\nWhat is your name?"
      read CUSTOMER_NAME
        RESULT_INSERT_CUSTOMER=$($PSQL "INSERT INTO customers (phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
        NEW_CUSTOMER_ID=$($PSQL "SELECT customer_id from customers where phone='$CUSTOMER_PHONE'")
        #Adding a new customer
        RESULT_INSERT_APPOINTMENT_NEWC=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES('$NEW_CUSTOMER_ID', '$SERVICE_ID_SELECTED', '$SERVICE_TIME')")
        CUSTOMER_NAME_NEW=$($PSQL "SELECT name from customers WHERE customer_id='$NEW_CUSTOMER_ID'")
        SELECTED_SERVICE=$($PSQL "SELECT name from services WHERE service_id='$SERVICE_ID_SELECTED'")
        echo -e "\nI have put you down for a $SELECTED_SERVICE at $SERVICE_TIME, $CUSTOMER_NAME_NEW."
        else
        #If there is already one in database, lets use hes/her information
        RESULT_INSERT_APPOINTMENT_OLDC=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES('$C_ID', '$SERVICE_ID_SELECTED', '$SERVICE_TIME')")
        CUSTOMER_NAME_OLD=$($PSQL "SELECT name from customers WHERE customer_id='$C_ID'")
        SELECTED_SERVICE=$($PSQL "SELECT name from services WHERE service_id='$SERVICE_ID_SELECTED'")
        echo -e "\nI have put you down for a $SELECTED_SERVICE at $SERVICE_TIME, $CUSTOMER_NAME_OLD."
      fi
  fi
fi
}
MAIN_MENU

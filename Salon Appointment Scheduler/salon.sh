#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon -t --no-align -c"

# Function to display the main menu
MAIN_MENU() {
  if [[ $1 ]]; then
    echo -e "\n$1"
  fi

  AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services")

  if [[ -n $AVAILABLE_SERVICES ]]; 
  then
    echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR NAME; do
    echo "$SERVICE_ID $NAME" | sed 's/|/) /'
    done

    echo -e "\nIs there any service you would like to order?"
    read SERVICE_ID_SELECTED

    if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]; then
      MAIN_MENU "That is not a valid service number."
    else
      echo -e "\nWHAT is your phone number?"
      read CUSTOMER_PHONE

      # Check if the phone number exists in our system
      C_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

      # If the phone number doesn't exist, prompt for name and insert the new customer
      if [[ -z "$C_ID" ]]; then
        echo -e "\nWhat is your name?"
        read CUSTOMER_NAME
        RESULT_INSERT_CUSTOMER=$($PSQL "INSERT INTO customers (phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
        C_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
      fi
      # Prompt for the service time
      echo -e "\nWhat time would suit you best?"
      read SERVICE_TIME
      
      # Insert the new appointment using the retrieved or newly created customer_id
      RESULT_INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES('$C_ID', '$SERVICE_ID_SELECTED', '$SERVICE_TIME')")
      # Retrieve the service name for the confirmation message
      SELECTED_SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id='$SERVICE_ID_SELECTED'")
      # Retrieve the customer name for the confirmation message
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id='$C_ID'")

      # Output the confirmation message
      echo -e "\nI have put you down for a $SELECTED_SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
    fi
  else
    MAIN_MENU "At the moment, there is no service available."
  fi
}

# Call the main menu function
MAIN_MENU

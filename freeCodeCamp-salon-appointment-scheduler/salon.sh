#!/bin/bash
# salon appointment scheduler bash file
PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~~~ MY SALON ~~~~~\n"

SERVICE_MENU() {
  SERVICE_LIST=$($PSQL "SELECT service_id, name FROM services;")
  if [[ $1 ]] 
  then
    echo -e "$1\n"
  fi
  echo -e "Welcome to my salon! How can I help you?\n"
  echo "$SERVICE_LIST" | while read SERVICE_ID BAR SERVICE
  do
    echo "$SERVICE_ID) $SERVICE"
  done
  
  # pick a service
  read SERVICE_ID_SELECTED
  
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then 
    # echo $CHOICE
    SERVICE_MENU "Please select a valid choice"
  else
    SERVICE_ID_SELECTED=$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    if [[ -z $SERVICE_ID_SELECTED ]]
    then 
      SERVICE_MENU "Please select a valid choice"
    else
      SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
      echo -e "\nWhat's your phone number?"
      read CUSTOMER_PHONE
      # search if there if not ask for name
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")
      # echo $CUSTOMER_ID
      if [[ -z $CUSTOMER_ID ]]
      then
        echo -e "\nI don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME
        CUSTOMER_ID_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
      else 
        CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
      fi
      # add the name and phone in customers
      # CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$PHONE_NUMBER'")
      echo -e "\nWhat time would you like your $(echo $SERVICE_NAME | sed -E 's/^ *| *$//'), $(echo $CUSTOMER_NAME | sed -E 's/^ *| *$//')?"
      read SERVICE_TIME
      SERVICE_ID_ADDED=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
      echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed -E 's/^ *| *$//') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -E 's/^ *| *$//')."
      
      # ask for time
    fi
  fi   
}
SERVICE_MENU

# CUSTOMER_MENU() {
#   echo "This is a customer menu"
# }
# APPOINTMENT() {
#   echo "This is a appointment menu"
# }

# MAIN_MENU() {
#   if [[ $1 ]]
#   then 
#     echo $1
#   fi
#   echo -e "WELCOME, to my Salon. What can we do for you?\n"
#   echo -e "1) Go to the services\n2) Go to the customer details\n3) Go to the appointements menu\n"
#   read CHOICE
#   if [[ ! $CHOICE =~ ^[0-9]+$ ]]
#   then 
#     # echo $CHOICE
#     MAIN_MENU "please select a valid choice"
#   else
#     # echo $CHOICE
#     if [[ $CHOICE == "1" ]]
#     then 
#       SERVICE_MENU
#     elif [[ $CHOICE == 2 ]]
#     then
#       CUSTOMER_MENU
#     elif [[ $CHOICE == 3 ]]
#     then 
#       APPOINTMENT
#     fi
#   fi
# }
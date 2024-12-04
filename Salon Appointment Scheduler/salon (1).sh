#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --no-align --tuples-only -c"

SERVICES=$($PSQL "SELECT service_id, name FROM services")
SERVICE_ID=$($PSQL "SELECT service_id FROM services")
IFS=$'\n' read -r -d '' -a SERVICE_ARRAY <<< "$SERVICE_ID"
echo -e "\nSelect a service."
echo $SERVICES | sed 's/|/) /g'
read SERVICE_ID_SELECTED

while [[ ! ${SERVICE_ARRAY[@]} =~ $SERVICE_ID_SELECTED ]]
do
	echo -e "\nSelected service not available.\nPlease select a service"
        echo $SERVICES | sed 's/|/) /g'
	read SERVICE_ID_SELECTED
done

echo -e "\nEnter your phone number"
read CUSTOMER_PHONE

CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
if [[ -z $CUSTOMER_ID ]]
then
	echo -e "\nEnter your name"
	read CUSTOMER_NAME
	CUSTOMER_ID=$($PSQL "INSERT INTO customers (phone, name) VALUES ('$CUSTOMER_PHONE','$CUSTOMER_NAME') RETURNING customer_id")
	CUSTOMER_ID=$(echo $CUSTOMER_ID | cut -d' ' -f1)
fi

echo -e "\nWhat time do you want?"
read SERVICE_TIME

APPOINTMENT_ID=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, CAST($SERVICE_ID_SELECTED AS INTEGER), '$SERVICE_TIME') RETURNING appointment_id")

if [[ -n $APPOINTMENT_ID ]]
then
	SERVICE=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
	NAME=$($PSQL "SELECT name FROM customers WHERE customer_id = $CUSTOMER_ID")
	echo I have put you down for a $SERVICE at $SERVICE_TIME, $NAME.
fi

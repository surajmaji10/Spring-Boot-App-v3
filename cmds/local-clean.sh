#!/bin/bash

echo "Cleaning the services locally..."
cd account-service
mvn clean
cd ..

cd marketplace-service
mvn clean
cd ..

cd wallet-service
mvn clean
cd ..

echo "Clean Done!"




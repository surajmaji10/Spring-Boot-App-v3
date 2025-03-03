#!/bin/bash

echo "Building the services locally..."
cd account-service
mvn clean package
cd ..

cd marketplace-service
mvn clean package
cd ..

cd wallet-service
mvn clean package
cd ..

echo "Build Done!"




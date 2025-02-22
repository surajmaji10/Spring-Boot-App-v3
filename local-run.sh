
#!/bin/bash

echo "Running the services locally..."
cd account-service
mvn spring-boot:run &
cd ..

cd marketplace-service
mvn spring-boot:run &
cd ..

cd wallet-service
mvn spring-boot:run &
cd ..





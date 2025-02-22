# README

## Overview
This project contains three microservices: `account-service`, `marketplace-service`, and `wallet-service`. This guide will help you build and run these services locally, using Docker, and on Kubernetes (Minikube).

## Prerequisites
- Java 21 or higher
- Maven
- Docker
- Minikube
- kubectl

## Installation Steps

### 1. Install Java 21  
```bash
sudo apt update
sudo apt install -y openjdk-21-jdk
java -version  # Verify installation
```

### 2. Install Maven  
```bash
sudo apt install -y maven
mvn -version  # Verify installation
```

### 3. Install Docker  
```bash
sudo apt install -y docker.io
sudo systemctl enable --now docker
sudo usermod -aG docker $USER  # Add current user to the Docker group (requires logout & login)
docker --version  # Verify installation
```

### 4. Install Minikube  
```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
minikube version  # Verify installation
```

### 5. Install kubectl  
```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client  # Verify installation
```


## Building the Services
Refer to the `local-build.sh`, `docker-build.sh` files

## Running the Services
Refer to the `local-run.sh`, `docker-run.sh`, `minikube-run.sh` files

## Stopping the Services
Refer to the `local-kill.sh`, `docker-kill.sh`, `minikube-kill.sh` files

## Cleaning the Services' build/image files
Refer to the `local-clean.sh`, `docker-clean.sh` files

## Configuration
The services are configured using the `application.properties` files located in the `src/main/resources` directory of each service. The configuration includes settings for running the services locally, in Docker, and on Minikube.

### Example Configuration for `account-service`

Make sure to apply these changes (comment/uncomment) to the `application.properties` files for each service (`account-service`, `marketplace-service`, and `wallet-service`) before running the services in the respective environments.

### Localhost
```properties
# Server and Port Config
server.port=8080
host.url=localhost
account.service.url=http://localhost:8080
wallet.service.url=http://localhost:8082
marketplace.service.url=http://localhost:8081

# H2 Database Config
spring.datasource.url=jdbc:h2:file:./data/mydb;DB_CLOSE_ON_EXIT=FALSE
spring.datasource.username=sa
spring.datasource.password=
spring.datasource.driver-class-name=org.h2.Driver
```

### Docker
```properties
# Server and Port Config
server.port=8080
host.url=host.docker.internal
account.service.url=http://host.docker.internal:8080
wallet.service.url=http://host.docker.internal:8082
marketplace.service.url=http://host.docker.internal:8081

# H2 Database Config
spring.datasource.url=jdbc:h2:file:./data/mydb;DB_CLOSE_ON_EXIT=FALSE
spring.datasource.username=sa
spring.datasource.password=
spring.datasource.driver-class-name=org.h2.Driver
```

### Minikube
```properties
# Server and Port Config
server.port=8080
host.url=account-service
account.service.url=http://account-service:8080
wallet.service.url=http://wallet-service:8080
marketplace.service.url=http://marketplace-service:8080

# H2 Database Config
spring.datasource.url=jdbc:h2:file:./data/mydb;DB_CLOSE_ON_EXIT=FALSE
spring.datasource.username=sa
spring.datasource.password=
spring.datasource.driver-class-name=org.h2.Driver
```

## JPA/Hibernate settings
```properties
spring.jpa.show-sql=true
# H2 Console settings (optional, for accessing the H2 web console)
spring.h2.console.enabled=true
spring.h2.console.path=/h2-console
spring.jpa.hibernate.ddl-auto=create
# Enable H2 web server access
spring.h2.console.settings.web-allow-others=true
logging.level.org.hibernate=WARN
```

## Accessing the Services

| Environment  | Account Service | Marketplace Service | Wallet Service | H2DB Service |
|-------------|----------------|----------------------|----------------|--------------|
| **Locally**  | [http://localhost:8080](http://localhost:8080) | [http://localhost:8081](http://localhost:8081) | [http://localhost:8082](http://localhost:8082) | N/A |
| **Docker**   | [http://localhost:8080](http://localhost:8080) | [http://localhost:8081](http://localhost:8081) | [http://localhost:8082](http://localhost:8082) | N/A |
| **Minikube** | [http://localhost:8080](http://localhost:8080) | [http://localhost:8081](http://localhost:8081) | [http://localhost:8082](http://localhost:8082) | [http://localhost:8083](http://localhost:8083) |




## Conclusion
This guide provides the necessary steps to build and run the microservices locally, using Docker, and on Kubernetes (Minikube). Follow the instructions carefully to ensure the services are set up correctly. If you encounter any issues, please refer to the configuration files and scripts provided in the project.

## Contact
#### @author: Akash Maji
#### @email: akashmaji@iisc.ac.in


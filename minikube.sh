#!/bin/bash  

# Start Minikube if not running  
echo "Starting Minikube..."  
minikube start --driver=docker  

# Verify Minikube is ready  
echo "Checking Minikube status..."  
minikube status  

# Create service directories if they don't exist  
echo "Creating service directories..."  
mkdir -p account-service marketplace-service wallet-service  

# Deploy Account Service  
echo "Deploying Account Service..."  
cd account-service || exit 
docker build -t account-service:latest . 
docker image tag account-service:latest account-service:1.0
minikube image load account-service:1.0
kubectl apply -f deployment.yaml  
cd ..  

# Deploy Marketplace Service  
echo "Deploying Marketplace Service..."  
cd marketplace-service || exit  
docker build -t marketplace-service:latest .
docker image tag marketplace-service:latest marketplace-service:1.0
minikube image load marketplace-service:1.0
kubectl apply -f deployment.yaml  
cd ..  

# Deploy Wallet Service  
echo "Deploying Wallet Service..."  
cd wallet-service || exit  
docker build -t wallet-service:latest .
docker image tag wallet-service:latest wallet-service:1.0
minikube image load wallet-service:1.0
kubectl apply -f deployment.yaml  
cd ..  

# Verify pods are running  
echo "Checking pods..."  
kubectl get pods  

# Forward ports for each service  
echo "Setting up port forwarding..."  
kubectl -n default port-forward deployment/account-service 8080:8080 &  
kubectl -n default port-forward deployment/marketplace-service 8081:8081 &  
kubectl -n default port-forward deployment/wallet-service 8082:8082 &  

minikube tunnel


# Output the access URLs  
echo "Services are available at:"  
echo "Account Service: http://localhost:8080"  
echo "Marketplace Service: http://localhost:8081"  
echo "Wallet Service: http://localhost:8082"  

# Keep the script running to maintain the port-forwarding processes  
while true; do  
  sleep 3600  
done


docker run -p 8080:8080 --name app1 --add-host=host.docker.internal:host-gateway account-service:0.0 &

docker run -p 8082:8080 --name app3 --add-host=host.docker.internal:host-gateway wallet-service:0.0 &

docker run -p 8081:8080 --name app2 --add-host=host.docker.internal:host-gateway marketplace-service:0.0 &





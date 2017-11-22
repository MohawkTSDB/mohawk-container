# mohawk-container
Mohawk metric data storage engine, this repository include scripts for the containerized version.


```
# connect to server
sudo systemctl start docker

# build and tag
docker build -t mohawktsdb/mohawk ./
docker tag yaacov/mohawk docker.io/mohawktsdb/mohawk

# login and push image
docker login
sudo docker push docker.io/mohawktsdb/mohawk

# run image
docker run --name mohawk -e HAWKULAR_BACKEND="memory" -v $(readlink -f ./):/root/ssh:Z mohawktsdb/mohawk
```

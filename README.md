# mohawk-container
Mohawk metric data storage engine, this repository include scripts for the containerized version.


```
# connect to server
sudo systemctl start docker

# build and tag
docker build -t yaacov/mohawk ./
docker tag yaacov/mohawk docker.io/yaacov/mohawk

# login and push image
docker login
sudo docker push docker.io/yaacov/mohawk

# run image
docker run --name mohawk -e HAWKULAE_BACKEND="memory" -v $(readlink -f ./):/root/ssh:Z yaacov/mohawk
```

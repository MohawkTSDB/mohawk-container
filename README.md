# mohawk-container
Mohawk metric data storage engine, this repository include scripts for the containerized version.

See [Run on Kubernetes and OpenShift](/container-metrics) for information about running on Kubernetes and openshift.

```
# start docker server if not running
# sudo systemctl start docker

# build and tag
docker build -t yaacov/mohawk -f ./mohawk-container/Dockerfile ./
docker tag yaacov/mohawk docker.io/yaacov/mohawk:latest

# login
docker login

# push image
docker push docker.io/yaacov/mohawk:latest

# run image with storage "memory"
# assume we have server.key and server.pem in "../mohawk/" directory
docker run --name mohawk -e HAWKULAR_STORAGE="memory" \
           -v $(readlink -f ../mohawk/):/root/ssh:Z yaacov/mohawk:latest
```

# mohawk-container/container-metrics

## Setup metrics on Kubernetes and OpenShift

#### On OpenShift:
```
wget https://raw.githubusercontent.com/yaacov/mohawk-container/master/container-metrics/setup.sh

oc project kube-system

export MOHAWK_URL=<url of mohawk route>
bash ./setup.sh
```

#### On Kubernetes:

```
# Add cluster admin role to system:anonymous
kubectl create clusterrolebinding kube-system-cluster-admin --user system:serviceaccount:kube-system:default --clusterrole cluster-admin
kubectl create clusterrolebinding kube-system-cluster-admin --user system:anonymous --clusterrole cluster-admin

# Get and run template
wget https://raw.githubusercontent.com/yaacov/mohawk-container/master/container-metrics/mohawk-k8s-with-crt.yaml
kubectl create -f Projects/mohawk-container/mohawk-k8s-with-crt.yaml

```

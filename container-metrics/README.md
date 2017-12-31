# mohawk-container/container-metrics

## Setup metrics on k8s and OpenShift

#### On OpenShift:
```
wget https://raw.githubusercontent.com/yaacov/mohawk-container/master/container-metrics/setup.sh

bash ./setup.sh
```

#### On k8s:

```
# Add cluster admin role to system:anonymous
kubectl create clusterrolebinding kube-system-cluster-admin --user system:serviceaccount:kube-system:default --clusterrole cluster-admin
kubectl create clusterrolebinding kube-system-cluster-admin --user system:anonymous --clusterrole cluster-admin

# Get and run template
wget https://raw.githubusercontent.com/yaacov/mohawk-container/master/container-metrics/mohawk-k8s-with-crt.yaml
kubectl create -f Projects/mohawk-container/mohawk-k8s-with-crt.yaml

```

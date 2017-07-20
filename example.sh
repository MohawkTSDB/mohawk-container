# delete running mohawk pod, route and service
oc process -f mohawk-template.yaml | oc delete -f -

# set mohawk pod with nip.io route
oc process -f mohawk-template.yaml -p ROUTE_URL="mohawk.$(ifconfig eth0 | grep 'inet ' | cut -f 10 -d' ').nip.io" | oc create -f -

# get system IP , must be run on openshift master
export MOHAWK_URL="mohawk.$(ifconfig eth0 | grep 'inet ' | cut -f 10 -d' ').nip.io"

# check if server is running
curl -k https://${MOHAWK_URL}/hawkular/metrics/status

# check if server is getting metrics from heapster
curl -k https://${MOHAWK_URL}/hawkular/metrics/metrics -H "Hawkular-Tenant: _system"

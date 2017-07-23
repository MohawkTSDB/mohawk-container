# setting the metrics service from template
# -----------------------------------------

# get system IP , must be run on openshift master
# we will use this value to set the route to the metrics service
export MOHAWK_URL="mohawk.$(ifconfig eth0 | grep 'inet ' | cut -f 10 -d' ').nip.io"

# delete running mohawk pod, route and service
oc process -f mohawk-template.yaml | oc delete -f -

# set mohawk pod with nip.io route
#   in this example we overide the default ROUTE_URL ( default value is mohawk.${MASTER_URL} )
oc new-app -f mohawk-template.yaml -p ROUTE_URL="${MOHAWK_URL}"

# check if server is running
# --------------------------

curl -k https://${MOHAWK_URL}/hawkular/metrics/status
curl -k https://${MOHAWK_URL}/hawkular/metrics/metrics -H "Hawkular-Tenant: _system"

# setting the openshift consule
# -----------------------------

# set the metrics public url
sed -i "/metricsPublicURL:/d" /etc/origin/master/master-config.yaml
sed -i "/assetConfig:/a  \ \ metricsPublicURL: \"https://${MOHAWK_URL}/hawkular/metrics\"" /etc/origin/master/master-config.yaml

# restart openshift
systemctl restart origin-master.service

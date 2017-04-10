#!/bin/sh
# Usage source kubectl_demo TOKEN NAMESPACE

if [ -z "$1" ] || [ -z "$2" ]
  then
	echo "Usage: source kubectl_demo TOKEN NAMESPACE"
  else
	cp examples/templates/*.yml examples/
	find examples/*.yml -type f -exec sed -i 's/{NAMESPACE}/'$2'/g' {} +
  	alias kubectl_demo="kubectl --certificate-authority='ca.crt' --server='https://k8s.osso.ninja' --token='$1' --namespace $2"
    echo "Kubectl alias set, you can now deploy the base Nginx example using: " 
	echo "kubectl_demo create -f examples/nginx_base.yml"
fi




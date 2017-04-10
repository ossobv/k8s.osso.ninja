k8s.osso.ninja
==============

Getting started
---------------

1. Copy the templates to another directory for example:
   
   ``cp examples/templates/*.yml examples/``

2. Replace all {NAMESPACE} occurances with the namespace on your label

  ``find examples/*.yml -type f -exec sed -i 's/{NAMESPACE}/'$2'/g' {} +``

3. Create an alias with your TOKEN and NAMESPACE: 

  ``alias kubectl_demo="kubectl --certificate-authority='/full/path/to/ca.crt' --server='https://k8s.osso.ninja' --token='TOKEN' --namespace NAMESPACE"```

4. Check if it works: 

 ``# kubectl_demo get pods``
 
 Should give no errors and return nothing.

Examples
--------

After running the script above, the following examples are copied 
from examples/sources and configured for the NAMESPACE above:

- examples/nginx-base.yml: basic Nginx setup (hello world)
- examples/nginx-static-html.yml: Nginx with content via configmaps.
- examples/nginx-healthcheck.yml: nginx-static-html + healthchecks.

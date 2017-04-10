k8s.osso.ninja
==============

Getting started
---------------

1. Copy the templates to another directory for example:
   
   ``cp templates/*.yml examples/``

2. Replace all {NAMESPACE} occurances with the NAMESPACE on your label:

  ``find *.yml -type f -exec sed -i 's/{NAMESPACE}/NAMESPACE/g' {} +``

3. Create an alias with your TOKEN and NAMESPACE: 

  ``alias kubectl_demo="kubectl --certificate-authority='/full/path/to/ca.crt' --server='https://k8s.osso.ninja' --token='TOKEN' --namespace NAMESPACE"```

4. Check if it works: 

 ``# kubectl_demo get pods``
 
 Should give no errors and return nothing.


Example 1: basic Nginx
----------------------

1. Deploy the basic Nginx app with:

  ``kubectl_demo create -f nginx-base.yml``

2. Follow the creation of the pods with

   ``kubectl_demo get pods``

4. When the pod is running (1/1), link to NAMESPACE.osso.ninja to view the Nginx webpage.

3. View the logs with:

   ``kubectl_demo logs #PODNAME#``

   Where #PODNAME# is a full name from the output of step 2. 

4. Attach to the container with:

   ``kubectl_demo exec -ti #PODNAME# /bin/bash`` 


Example 2: static html Nginx
----------------------------

Note: Remove existing deployments: 
 
   ``kubectl_demo delete -f filename.yml``


1. Deploy the static html Nginx app with:

  ``kubectl_demo create -f nginx-static-html.yml``

2. Follow the creation of the pods with

   ``kubectl_demo get pods``

3. Wait until pod is running and link to NAMESPACE.osso.ninja

4. Remove deployments:

   ``kubectl_demo create -f nginx-static-html.yml``

4. Edit nginx-static-html.yml and change the contents of the webpage in the configmap

5. Re-run step 1.


Example 3: K8s healthchecks
---------------------------

Note: Remove existing deployments: 
 
   ``kubectl_demo delete -f filename.yml``


1. Deploy the healthcheck Nginx app with:

  ``kubectl_demo create -f nginx-healthcheck.yml``

2. Follow the creation of the pods with

   ``kubectl_demo get pods``

3. Wait until pod is running and link to NAMESPACE.osso.ninja

4. Read the yml file for more info about healthchecks.


Example 4: Django websocket redis simple chat
---------------------------------------------

Note: Remove existing deployments: 
 
   ``kubectl_demo delete -f filename.yml``


1. Deploy the Django websocket redis app with:

  ``kubectl_demo create -f django-websocket-redis.yml``

2. Follow the creation of the pods with

   ``kubectl_demo get pods``

3. Wait until both pods are running and link to NAMESPACE.osso.ninja

4. Read the yml file for more info about the setup.

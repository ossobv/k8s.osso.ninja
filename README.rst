k8s.osso.ninja
==============

Getting started
---------------

1. Fetch this repository::

    git clone https://github.com/ossobv/k8s.osso.ninja.git

#. Copy the templates to another directory, for example::

    mkdir NAMESPACE
    cp templates/*.yml NAMESPACE/

#. Replace all ``{NAMESPACE}`` occurrences with the NAMESPACE on your label::

    cd NAMESPACE
    find . -name '*.yml' -type f -exec sed -i 's/{NAMESPACE}/NAMESPACE/g' {} +

#. Create a kubectl alias with your TOKEN and NAMESPACE::

    alias kubectl_demo="kubectl --certificate-authority='/full/path/to/ca.crt' \
      --server='https://k8s.osso.ninja' --token='TOKEN' --namespace NAMESPACE"

   The ``ca.crt`` is in the repository root.

#. Check that it works::

    kubectl_demo get pods

   It should give no errors and return nothing.


Example 1: basic Nginx
----------------------

1. Deploy the basic Nginx app with::

    kubectl_demo create -f nginx-base.yml

#. Follow the creation of the pods with::

    kubectl_demo get pods

#. When the pod is running (1/1), browse to NAMESPACE.osso.ninja to view
   the Nginx webpage.

#. View the logs with::

    kubectl_demo logs PODNAME

   Where PODNAME is a full name from the output of step 2.

#. Attach to the container with::

    kubectl_demo exec -ti PODNAME /bin/bash


Example 2: static html Nginx
----------------------------

.. note:: **Removing existing deployments**

    Removing existing deployments can be done by the inverse of
    ``create``: ``delete``::

        kubectl_demo delete -f filename.yml

----

1. Deploy the static html Nginx app with::

    kubectl_demo create -f nginx-static-html.yml

#. Follow the creation of the pods with::

    kubectl_demo get pods

#. Wait until pod is running and link to NAMESPACE.osso.ninja.

#. Remove deployments::

    kubectl_demo create -f nginx-static-html.yml

#. Edit nginx-static-html.yml and change the contents of the webpage in
   the configmap.

#. Re-run step 1.


Example 3: K8s healthchecks
---------------------------

1. Deploy the healthcheck Nginx app with::

    kubectl_demo create -f nginx-healthcheck.yml

#. Follow the creation of the pods with::

    kubectl_demo get pods

#. Wait until pod is running and browse to NAMESPACE.osso.ninja.

#. Read the yml file for more info about health-checks.


Example 4: Django websocket redis simple chat
---------------------------------------------

1. Deploy the Django websocket redis app with::

    kubectl_demo create -f django-websocket-redis.yml

#. Follow the creation of the pods with::

    kubectl_demo get pods

#. Wait until both pods are running and link to NAMESPACE.osso.ninja.

#. Read the yml file for more info about the setup.

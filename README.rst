k8s.osso.ninja
==============

Getting started
---------------

# source kubectl_demo TOKEN NAMESPACE

Examples
--------

After running the script above, the following examples are copied 
from examples/sources and configured for the NAMESPACE above:

- examples/nginx-base.yml: basic Nginx setup (hello world)
- examples/nginx-static-html.yml: Nginx with content via configmaps.
- examples/nginx-healthcheck.yml: nginx-static-html + healthchecks.

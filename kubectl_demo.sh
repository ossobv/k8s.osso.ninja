#!/bin/sh
# Usage source kubectl_demo TOKEN NAMESPACE
alias kubectl_demo="kubectl --certificate-authority='ca.crt' --server='https://k8s.osso.ninja' --token='$1' --namespace $2"

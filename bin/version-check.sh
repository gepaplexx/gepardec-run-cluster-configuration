#!/bin/bash

PRG=`basename $0`

DIR=$(dirname $0)
HOME=${DIR-.}/..

ARGO_APPLICATIONS="cluster-applications cluster-setup-checkpoint initial-cluster-setup"
CLUSTERS="vshn"

for f in $(find $HOME -name Chart.yaml); do
    chart=$(dirname $f)
    for CLUSTER in ${CLUSTERS}; do
      echo $chart
      helm template ${chart} -s templates/02-argo-application.yaml --values ${chart}/values/values-${CLUSTER}.yaml > ${HOME}/versions/$(basename $chart)-${CLUSTER}.yaml
    done
done
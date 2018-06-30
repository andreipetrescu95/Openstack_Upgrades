#!/bin/bash
ADMIN_RC=$1
REGION=$2
HOST=$3
source $ADMIN_RC
openstack user create --domain default --password placement placement
openstack role add --project service --user placement admin
openstack service create --name placement --description "Placement API" placement
openstack endpoint create --region $REGION placement public http://$HOST:8778
openstack endpoint create --region $REGION placement internal http://$HOST:8778
openstack endpoint create --region $REGION placement admin http://$HOST:8778
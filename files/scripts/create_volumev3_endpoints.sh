#!/bin/bash
ADMIN_RC=$1
REGION=$2
HOST=$3
source $ADMIN_RC
openstack service create --name cinderv3 --description "OpenStack Block Storage" volumev3
openstack endpoint create --region $REGION volumev3 public http://$HOST:8776/v3/%\(project_id\)s
openstack endpoint create --region $REGION volumev3 internal http://$HOST:8776/v3/%\(project_id\)s
openstack endpoint create --region $REGION volumev3 admin http://$HOST:8776/v3/%\(project_id\)s
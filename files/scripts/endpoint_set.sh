#!/bin/bash
source $1
ADMIN_EP=$(openstack endpoint list | grep admin | grep $2 | cut -d'|' -f2 | tr -d ' ')
INTERNAL_EP=$(openstack endpoint list | grep internal | grep $2 | cut -d'|' -f2 | tr -d ' ')
PUBLIC_EP=$(openstack endpoint list | grep public | grep $2 | cut -d'|' -f2 | tr -d ' ')

openstack endpoint set --url $3 $ADMIN_EP
openstack endpoint set --url $4 $INTERNAL_EP
openstack endpoint set --url $5 $PUBLIC_EP
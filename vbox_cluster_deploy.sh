#!/bin/bash

#echo -n "Deploy MapR using  [vbox]? "


#read nodecount

echo -n "How many nodes [1-5]? "
read nodecount

if echo "$nodecount" | grep -iq "^1" ;then
    echo "MapR Cluster Deployment - 1 node"
    ansible-playbook -i myhosts/1node_cluster_vbox cluster-unsecure.yml

    #vboxmanage import /Volumes/Backup/VirtualMachineBackups/CentOS_7.2/MAPRN01_CentOS7.2.ova --vsys 0 --vmname MAPRN01_CentOS7.2
    #vboxmanage import /Volumes/Backup/VirtualMachineBackups/CentOS_7.2/MAPRN02_CentOS7.2.ova --vsys 0 --vmname MAPRN02_CentOS7.2

elif echo "$nodecount" | grep -iq "^2" ;then
    echo "MapR Cluster Deployment - 2 nodes"
    ansible-playbook -i myhosts/2node_cluster_vbox cluster-unsecure.yml
elif echo "$nodecount" | grep -iq "^3" ;then
    echo "3 nodes"
elif echo "$nodecount" | grep -iq "^4" ;then
    echo "4 nodes"
elif echo "$nodecount" | grep -iq "^5" ;then
    echo "5 nodes"
fi

#vboxmanage import /Volumes/Backup/VirtualMachineBackups/CentOS_7.2/MAPRN02_CentOS7.2.ova
#vboxmanage import /Volumes/Backup/VirtualMachineBackups/CentOS_7.2/MAPRN02_CentOS7.2.ova

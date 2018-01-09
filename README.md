# Disclaimer
Not for production use and not officially supported by MapR Technologies.
Ansible scripts work on Redhat/CentOS only.
Please note that deployment using these ansible scripts result in default passwords!


# Pre-requisites
git, ansible

# Configuration
1. Specify the MapR and Eco-System versions in /group_vars/all

2. Specify the disks for MapR-FS in /group_vars/all using a comma separated notation, eg:
disks: /dev/xvdb,/dev/xvdc,/dev/xvdd

3. Clone a template from /myhosts/ and define a cluster layout
Define the cluster layout by adding the various nodes as well as compontents to be installed.

4. Execute the ansibple playbook. For example:
ansible-playbook -i myhosts/vbox_1node_cluster cluster-unsecure.yml

# This a collection of Ansible scripts for deploying MapR v5.2.x and v6.x
# As this is my own creation, this is not supported by MapR

## Supported OS

* Redhat 7 or higher
* CentOS 7 or higher

Please validate the MapR OS Support Matrix prior to deployment:
http://maprdocs.mapr.com/home/InteropMatrix/r_os_matrix.html

Ansible 2.1 or higher required!
```
yum install ansible
```

## Configuration
Set the appropriate MapR and eco-system versions, cluster name and harddisks in:
```
vi group_vars/all
```

Grab a template form the myhosts/ folder (eg: 3 or 5 node cluster) and modify the IP addresses

## Install MapR unsecure cluster

Use `hosts_template` as template and copy it and the hostnames to the components you want to get installed. If components are not required, just leave the block empty. Then run:

```
ansible-playbook -i hosts_template site-unsecure.yml
```

## Install cluster with native security
<todo>
>>>>>>> Stashed changes

# Prerequisites
ansible-playbook mapr-prereq-selinux.yml
ansible-playbook mapr-prereq-repos.yml
ansible-playbook mapr-prereq-gpgkey.yml
ansible-playbook mapr-prereq-epel.yml

# MapR Packages - Controlnodes
ansible-playbook mapr-core-zookeeper.yml
ansible-playbook mapr-core-cldb.yml
ansible-playbook mapr-core-webserver.yml

# MapR Packages - Datanodes
ansible-playbook mapr-core-fileserver.yml
ansible-playbook mapr-core-nfs.yml

# Ecosystem
#ansible-playbook mapr-ecosystem-mapreduce.yml
ansible-playbook mapr-ecosystem-yarn.yml
ansible-playbook mapr-ecosystem-drill.yml
ansible-playbook mapr-ecosystem-spark-on-yarn.yml

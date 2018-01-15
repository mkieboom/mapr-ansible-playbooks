#!/bin/bash

# Setup the replication (on demo##.mapr.com cluster)

# Create a separate volume
maprcli volume create -name remote-image-classification -path /remote-image-classification

# Remove existing replication (if it is there)

# Get the MapR Cluster name
MAPR_CLUSTER_NAME=`head -n 1 /opt/mapr/conf/mapr-clusters.conf | awk '{print $1}'`

# Cleanup previous table and replication
maprcli table replica remove -path /mapr/trainer.mapr.com/image-classification/output/database/image-output-table -replica /mapr/$MAPR_CLUSTER_NAME/remote-image-classification/remote-image-output-table
hadoop fs -rm -f /remote-image-classification/remote-image-output-table

# Setup replication
maprcli table replica autosetup -path /mapr/trainer.mapr.com/image-classification/output/database/image-output-table -replica /mapr/$MAPR_CLUSTER_NAME/remote-image-classification/remote-image-output-table

#!/bin/bash

### LAB - 2 ###

# Create the MapR-DB output table
hadoop fs -rm -f /image-classification/output/database/image-output-table
maprcli table create -path /image-classification/output/database/image-output-table -tabletype json
maprcli table cf edit -path /image-classification/output/database/image-output-table -cfname default -readperm p -writeperm p -traverseperm  p

# BONUS # Create the MapR-ES Stream (imageclassification-output-stream) 
hadoop fs -rm -f /image-classification/output/streams/imageclassification-output-stream
maprcli stream create -path /image-classification/output/streams/imageclassification-output-stream -produceperm p -consumeperm p -topicperm p

# BONUS # Create a topic (image-events) in that stream
maprcli stream topic create -path /image-classification/output/streams/imageclassification-output-stream -topic image-events -partitions 3


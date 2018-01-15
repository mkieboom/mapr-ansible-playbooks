#!/bin/bash

### LAB - 1 ###

# Create volume for image input
maprcli volume create -name image-classification -path /image-classification
maprcli volume create -name input -path /image-classification/input
maprcli volume create -name output -path /image-classification/output

hadoop fs -mkdir /image-classification/input/images/
hadoop fs -mkdir /image-classification/input/database/
hadoop fs -mkdir /image-classification/input/streams/

hadoop fs -mkdir /image-classification/output/images/
hadoop fs -mkdir /image-classification/output/json/
hadoop fs -mkdir /image-classification/output/database/
hadoop fs -mkdir /image-classification/output/streams/

# Create volumes for error and archive records
maprcli volume create -name archive -path /image-classification/archive/
maprcli volume create -name error -path /image-classification/error/
hadoop fs -chmod -R 777 /image-classification


# Create a MapR-ES Stream (imageclassification-stream) and Topic
hadoop fs -rm -f /image-classification/input/streams/imageclassification-stream
maprcli stream create -path /image-classification/input/streams/imageclassification-stream -produceperm p -consumeperm p -topicperm p

# Create a topic (image-events) in that stream
maprcli stream topic create -path /image-classification/input/streams/imageclassification-stream -topic image-events -partitions 3

# BONUS # Create a MapR-DB Table (Input)
hadoop fs -rm -f /image-classification/input/database/image-input-table
maprcli table create -path /image-classification/input/database/image-input-table -tabletype json
maprcli table cf edit -path /image-classification/input/database/image-input-table -cfname default -readperm p -writeperm p -traverseperm  p

# Validate if the stream and topic are create successfully
maprcli stream topic list -path /image-classification/input/streams/imageclassification-stream -json
maprcli stream topic info -path /image-classification/input/streams/imageclassification-stream -topic image-events -json

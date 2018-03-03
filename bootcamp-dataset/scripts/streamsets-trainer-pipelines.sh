#!/bin/bash

# Import the pipelines
/opt/streamsets-datacollector/bin/streamsets cli \
-U http://localhost:18630 \
-u admin -p admin store import \
-n trainer1 \
-f "/bootcamp/mapr-ansible-playbooks/bootcamp-dataset/streamsets_pipelines/Trainer/Trainer - 1 - MapR Streams to Docker (yolo-tiny).json"

/opt/streamsets-datacollector/bin/streamsets cli \
-U http://localhost:18630 \
-u admin -p admin store import \
-n trainer2 \
-f "/bootcamp/mapr-ansible-playbooks/bootcamp-dataset/streamsets_pipelines/Trainer/Trainer - 2 - Classified Images to MapR-DB & Streams.json"


# Start the pipelines
/opt/streamsets-datacollector/bin/streamsets cli -U http://localhost:18630 -u admin -p admin manager start -n trainer1
/opt/streamsets-datacollector/bin/streamsets cli -U http://localhost:18630 -u admin -p admin manager start -n trainer2

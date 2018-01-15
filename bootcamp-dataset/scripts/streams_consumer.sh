#!/bin/bash

# Streams consumer
/opt/mapr/kafka/kafka-0.9.0/bin/kafka-console-consumer.sh --new-consumer --bootstrap-server this.will.be.ignored:9092 --topic /image-classification/input/streams/imageclassification-stream:image-events

#!/bin/bash -e

source ./sourceme.sh

rm -rf OTF2_* taskgraph.*

echo "Synchronous launch of subtasks, pre-start annotation"
./error_pre_async
dot -Tpng -o taskgraph_pre_sync.png taskgraph.0.dot
mv OTF2_Archive OTF2_pre_sync


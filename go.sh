#!/bin/bash -e

source ./sourceme.sh

rm -rf OTF2_* taskgraph.*

echo "Synchronous launch of subtasks, no annotation"
./error
mv OTF2_archive OTF2_none_sync

echo "Asynchronous launch of subtasks, no annotation"
./error_async
mv OTF2_archive OTF2_none_async

echo "Synchronous launch of subtasks, post-start annotation"
./error_post
mv OTF2_archive OTF2_post_sync

echo "Asynchronous launch of subtasks, post-start annotation"
./error_post_async
mv OTF2_archive OTF2_post_async

echo "Synchronous launch of subtasks, pre-start annotation"
./error_pre
mv OTF2_archive OTF2_pre_sync

echo "Asynchronous launch of subtasks, pre-start annotation"
./error_pre_async
mv OTF2_archive OTF2_pre_async


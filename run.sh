#!/bin/sh

WORKDIR="$(pwd)"
cd models/research
protoc object_detection/protos/*.proto --python_out=.
export PYTHONPATH=$PYTHONPATH:`pwd`:`pwd`/slim
cd ${WORKDIR}
bash benchmark.sh 0 1
LOGS_DIR=$(ls | grep .logs)
./report.sh ${LOGS_DIR} 1 0
cat summary_gpu1.md


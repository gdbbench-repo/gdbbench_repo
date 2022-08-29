#!/bin/bash
if [ "${DATASET_DIR}" = "" ]; then
echo "WARNING: no data set dir specified. use lb 1M by default"
DATASET_DIR=p1000000_submission
fi

this_sh=`realpath $0`
this_path=${this_sh%/*}
LB_ROOT=`realpath ${this_path}/..`

NEO4J_DATA_DIR=/home/sxn/nfs/gdbbench_data
NEO4J_HOME=${LB_ROOT}/neo4j-community-3.3.6-SNAPSHOT
NEO4J_DB_DIR=$NEO4J_HOME/data/databases/graph.db

$NEO4J_HOME/bin/neo4j stop
rm -rf $NEO4J_HOME/data/*
$NEO4J_HOME/bin/neo4j-admin set-initial-password admin

if [ "${DATASET_FULL_DIR}" = "" ]; then
DATASET_FULL_DIR=${NEO4J_DATA_DIR}/${DATASET_DIR}
fi

echo "importing from ${DATASET_FULL_DIR}"

$NEO4J_HOME/bin/neo4j-import --into $NEO4J_DB_DIR \
  --id-type=INTEGER \
  --nodes:User              "${NEO4J_DATA_DIR}/header_neo4j/Userheader.csv,${DATASET_FULL_DIR}/User_[0-9]*_[0-9]*.csv" \
  --nodes:Device            "${NEO4J_DATA_DIR}/header_neo4j/Deviceheader.csv,${DATASET_FULL_DIR}/Device_[0-9]*_[0-9]*.csv" \
  --nodes:IP                "${NEO4J_DATA_DIR}/header_neo4j/IPheader.csv,${DATASET_FULL_DIR}/IP_[0-9]*_[0-9]*.csv" \
  --relationships:Follow    "${NEO4J_DATA_DIR}/header_neo4j/Followheader.csv,${DATASET_FULL_DIR}/Follow_[0-9]*_[0-9]*.csv" \
  --relationships:Referrer  "${NEO4J_DATA_DIR}/header_neo4j/Referrerheader.csv,${DATASET_FULL_DIR}/Referrer_[0-9]*_[0-9]*.csv" \
  --relationships:UseDevice "${NEO4J_DATA_DIR}/header_neo4j/UseDeviceheader.csv,${DATASET_FULL_DIR}/UseDevice_[0-9]*_[0-9]*.csv" \
  --relationships:UseIP     "${NEO4J_DATA_DIR}/header_neo4j/UseIPheader.csv,${DATASET_FULL_DIR}/UseIP_[0-9]*_[0-9]*.csv" \
  --delimiter '|'
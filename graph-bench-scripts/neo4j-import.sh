#!/bin/bash
if [ "${DATASET_DIR}" = "" ]; then
echo "WARNING: no data set dir specified. use lb 1M by default"
DATASET_DIR=lb_orig/n1000000
fi

NEO4J_DATA_DIR=/home/sxn/LinkBench-GS/generated_data
NEO4J_HOME=/home/sxn/LinkBench-GS/neo4j-community-3.3.6-SNAPSHOT
NEO4J_DB_DIR=$NEO4J_HOME/data/databases/graph.db

echo "importing from ${NEO4J_DATA_DIR}/${DATASET_DIR}"

$NEO4J_HOME/bin/neo4j-import --into $NEO4J_DB_DIR \
  --id-type=INTEGER \
  --nodes:nt "${NEO4J_DATA_DIR}/Nodeheader.csv,${NEO4J_DATA_DIR}/${DATASET_DIR}/Node_[0-9]*_[0-9]*.csv" \
  --relationships:lt "${NEO4J_DATA_DIR}/Linkheader.csv,${NEO4J_DATA_DIR}/${DATASET_DIR}/Link_[0-9]*_[0-9]*.csv" \
  --delimiter '|'
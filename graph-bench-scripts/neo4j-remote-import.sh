if [ "${rhost}" = "" ]; then
echo "WARNING: no rhost specified. use val06 by default"
rhost=val06
fi
this_sh=`realpath $0`
this_path=${this_sh%/*}

if [ "${DATASET_DIR}" = "" ]; then
echo "WARNING: no data set dir specified. use lb 1M by default"
DATASET_DIR=lb_orig/n1000000
fi

scp $this_path/neo4j-import.sh $rhost:$this_path/
scp $this_path/neo4j-import-ali.sh $rhost:$this_path/
ssh $rhost "export DATASET_DIR=${DATASET_DIR}; ${this_path}/neo4j-import-ali.sh"
neo4jhome=/home/sxn/LinkBench-GS/neo4j-community-3.3.6-SNAPSHOT
cd $neo4jhome
if [ `pwd` != $neo4jhome ]; then
  exit 1
fi
# mkdir -p /dev/shm/sxn-tmpfs
# mkdir -p /dev/shm/sxn-tmpfs/neo4jdatadir
./bin/neo4j stop
# rm -rf data/neo4jdatadir/*
rm -rf $neo4jhome/data/*
./bin/neo4j-admin set-initial-password admin
# ./bin/neo4j start
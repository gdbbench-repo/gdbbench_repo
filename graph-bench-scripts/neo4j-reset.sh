NEO4J_HOME=/home/sxn/LinkBench-GS/neo4j-community-3.3.6-SNAPSHOT
$NEO4J_HOME/bin/neo4j stop
rm -rf $NEO4J_HOME/data/*; cp -r ~/nfs/linkbench_data/neo4j-3-self/data-200000/* $NEO4J_HOME/data/
if [ "${rhost}" = "" ]; then
echo "WARNING: no rhost specified. use val06 by default"
rhost=val06
else
echo "RESETING neo4j on ${rhost}"
fi
this_sh=`realpath $0`
this_path=${this_sh%/*}

ssh $rhost $this_path/neo4j-init.sh
$this_path/neo4j-remote-import.sh
ssh $rhost "ulimit -n 40000; $this_path/../neo4j-community-3.3.6-SNAPSHOT/bin/neo4j start"
sleep 15
/home/sxn/ldbc_snb/ldbc_snb_implementations/cypher/neo4j-server/bin/cypher-shell -u neo4j -a "bolt://val06:7687" -p admin "CREATE CONSTRAINT ON (n:nt) ASSERT n.id IS UNIQUE"

/home/sxn/ldbc_snb/ldbc_snb_implementations/cypher/neo4j-server/bin/cypher-shell -u neo4j -a "bolt://val06:7687" -p admin "MATCH (n) OPTIONAL MATCH (n)-[r]->() RETURN count(n.data) + count(r.data)"
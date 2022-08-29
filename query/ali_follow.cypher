match (a:User {id:$id1}), (b:User {id : $id2}) 
merge (a)-[r:Follow]->(b) 
set r.time = $time
return count(*) > 0
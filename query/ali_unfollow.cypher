match (a:User {id:$id1})-[r:Follow]->(b:User {id : $id2})
delete r
return count(r)>0
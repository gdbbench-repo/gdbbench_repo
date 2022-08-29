match (a:User {id:$id})-[:Follow]->(b)-[:Follow]->(c)
where c.id <> a.id
with c, count(b) as weight
return c.id as id, c.liveness as liveness, c.time as time, c.balance as balance order by weight desc limit 100
match (p:Person{id:$p_id})-[:likes]->(msg)<-[:likes]-(otherp) where otherp.id <> p.id
with otherp, count(msg) as score
order by score desc limit 50
return count(*) > 25;
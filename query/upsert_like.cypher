match (p:Person {id:$p_id}), (m:Message {id :$m_id})
with p, m
optional match (p)-[re:likes]->(m)
with p, m, count(re) as exists
merge (p)-[r:likes]->(m)
set r.creationDate=20120907164437850
return exists > 0
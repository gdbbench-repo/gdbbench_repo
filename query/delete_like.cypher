match (p:Person {id:$p_id})-[r:likes]->(m:Message {id :$m_id})
delete r
return count(r) > 0;
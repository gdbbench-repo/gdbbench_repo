match (p:Person{id:$p_id})-[:likes]->(msg) 
with msg 
order by msg.id desc limit 50
return count(msg) > 25;
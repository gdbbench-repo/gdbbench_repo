match path=(start_m:Message{id:$m_id})-[:replyOf*0..]->(p) where not (p)-[:replyOf]->()
foreach (n IN nodes(path) | set n.length = n.length + 1)
with p, path
match (p)-[:hasCreator]->(c)
set c.creationDate = c.creationDate+1
return sum(length(path) + 2)
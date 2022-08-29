match (u:User {id:$id})
with u
optional match (dev:Device {address:$macAddr})<-[:UseDevice]-(otherDevU)
with u, dev, count(otherDevU) as devUserCnt
where devUserCnt < $devLimit
optional match (ip:IP {address:$ipAddr})<-[:UseIP]-(otherIPU)
with u, dev, devUserCnt, ip, count(otherIPU) as ipUserCnt
where ipUserCnt < $ipLimit
merge (nDev:Device {address:$macAddr}) set nDev.time = $time
merge (nIp:IP {address:$ipAddr}) set nIp.time = $time
merge (u)-[useDev:UseDevice {time:$time}]->(nDev)
merge (u)-[useIP:UseIP {time:$time}]->(nIp)
set u.time = $time
with u
match p=(u)-[:Referrer*0..]->(b) where not (b)-[:Referrer]->()
foreach (n IN nodes(p) | set n.liveness = n.liveness + 1)
return sum(length(p)+1)
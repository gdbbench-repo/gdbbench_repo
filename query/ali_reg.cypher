optional match (u:User {id:$id})
with u where u = null
optional match (dev:Device {address:$macAddr})<-[:UseDevice]-(otherDevU)
with count(otherDevU) as devUserCnt
where devUserCnt < $devLimit
optional match (ip:IP {address:$ipAddr})<-[:UseIP]-(otherIPU)
with count(otherIPU) as ipUserCnt
where ipUserCnt < $ipLimit
merge (nDev:Device {address:$macAddr}) set nDev.time = $time
merge (nIp:IP {address:$ipAddr}) set nIp.time = $time
create (nIp)<-[:UseIP {time:$time}]-(nU:User {id:$id, time:$time, liveness:$liveness})-[:UseDevice {time:$time}]->(nDev)
with nU
return count(nU);
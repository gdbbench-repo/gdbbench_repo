match (a:User {id:$id1}), (b:User {id : $id2})
where a.balance >= $amount
set a.balance = a.balance-$amount, b.balance = b.balance+$amount
return count(*) > 0
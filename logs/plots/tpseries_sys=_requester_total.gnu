set terminal svg size 300,200
set lt 1 lc rgb 'red'
set lt 3 lc rgb 'green'
set lt 2 lc rgb 'blue'
set boxwidth 0.8
set ylabel "Throughput (K Txn/s)" offset 3,0
set xlabel "Time (s)" offset 0,0.5
set xtics nomirror

set ls 1 lc rgb 'red'
set ls 2 lc rgb 'green'
set ls 3 lc rgb 'blue'
set key bottom

# set xrange [0:260]

set output "svgs/tpseries-sysname=mysql-requesters-total.svg"
plot  "dat_dir/tpseries_sysname=mysql_requesters_total.dat" using ($1/1000):($2 /1000) t columnheader(2 ) w lp ps 0.6 pt 0\
    , "dat_dir/tpseries_sysname=mysql_requesters_total.dat" using ($1/1000):($3 /1000) t columnheader(3 ) w lp ps 0.6 pt 0\
    , "dat_dir/tpseries_sysname=mysql_requesters_total.dat" using ($1/1000):($4 /1000) t columnheader(4 ) w lp ps 0.6 pt 0\
    , "dat_dir/tpseries_sysname=mysql_requesters_total.dat" using ($1/1000):($5 /1000) t columnheader(5 ) w lp ps 0.6 pt 0\
    , "dat_dir/tpseries_sysname=mysql_requesters_total.dat" using ($1/1000):($6 /1000) t columnheader(6 ) w lp ps 0.6 pt 0\
    , "dat_dir/tpseries_sysname=mysql_requesters_total.dat" using ($1/1000):($7 /1000) t columnheader(7 ) w lp ps 0.6 pt 0\
    , "dat_dir/tpseries_sysname=mysql_requesters_total.dat" using ($1/1000):($8 /1000) t columnheader(8 ) w lp ps 0.6 pt 0\
    , "dat_dir/tpseries_sysname=mysql_requesters_total.dat" using ($1/1000):($9 /1000) t columnheader(9 ) w lp ps 0.6 pt 0\
    , "dat_dir/tpseries_sysname=mysql_requesters_total.dat" using ($1/1000):($10/1000) t columnheader(10) w lp ps 0.6 pt 0\

set output "svgs/tpseries-sysname=sggrpc-requesters-total.svg"
plot  "dat_dir/tpseries_sysname=sggrpc_requesters_total.dat" using ($1/1000):($2 /1000) t columnheader(2 ) w lp ps 0.6 pt 0\
    , "dat_dir/tpseries_sysname=sggrpc_requesters_total.dat" using ($1/1000):($3 /1000) t columnheader(3 ) w lp ps 0.6 pt 0\
    , "dat_dir/tpseries_sysname=sggrpc_requesters_total.dat" using ($1/1000):($4 /1000) t columnheader(4 ) w lp ps 0.6 pt 0\
    , "dat_dir/tpseries_sysname=sggrpc_requesters_total.dat" using ($1/1000):($5 /1000) t columnheader(5 ) w lp ps 0.6 pt 0\
    , "dat_dir/tpseries_sysname=sggrpc_requesters_total.dat" using ($1/1000):($6 /1000) t columnheader(6 ) w lp ps 0.6 pt 0\
    , "dat_dir/tpseries_sysname=sggrpc_requesters_total.dat" using ($1/1000):($7 /1000) t columnheader(7 ) w lp ps 0.6 pt 0\
    , "dat_dir/tpseries_sysname=sggrpc_requesters_total.dat" using ($1/1000):($8 /1000) t columnheader(8 ) w lp ps 0.6 pt 0\
    , "dat_dir/tpseries_sysname=sggrpc_requesters_total.dat" using ($1/1000):($9 /1000) t columnheader(9 ) w lp ps 0.6 pt 0\
    , "dat_dir/tpseries_sysname=sggrpc_requesters_total.dat" using ($1/1000):($10/1000) t columnheader(10) w lp ps 0.6 pt 0\

set output "svgs/tpseries-sysname=neo4j-requesters-total.svg"
plot  "dat_dir/tpseries_sysname=neo4j_requesters_total.dat" using ($1/1000):($2 /1000) t columnheader(2 ) w lp ps 0.6 pt 0\
    , "dat_dir/tpseries_sysname=neo4j_requesters_total.dat" using ($1/1000):($3 /1000) t columnheader(3 ) w lp ps 0.6 pt 0\
    , "dat_dir/tpseries_sysname=neo4j_requesters_total.dat" using ($1/1000):($4 /1000) t columnheader(4 ) w lp ps 0.6 pt 0\
    , "dat_dir/tpseries_sysname=neo4j_requesters_total.dat" using ($1/1000):($5 /1000) t columnheader(5 ) w lp ps 0.6 pt 0\
    , "dat_dir/tpseries_sysname=neo4j_requesters_total.dat" using ($1/1000):($6 /1000) t columnheader(6 ) w lp ps 0.6 pt 0\
    , "dat_dir/tpseries_sysname=neo4j_requesters_total.dat" using ($1/1000):($7 /1000) t columnheader(7 ) w lp ps 0.6 pt 0\
    , "dat_dir/tpseries_sysname=neo4j_requesters_total.dat" using ($1/1000):($8 /1000) t columnheader(8 ) w lp ps 0.6 pt 0\
    , "dat_dir/tpseries_sysname=neo4j_requesters_total.dat" using ($1/1000):($9 /1000) t columnheader(9 ) w lp ps 0.6 pt 0\
    , "dat_dir/tpseries_sysname=neo4j_requesters_total.dat" using ($1/1000):($10/1000) t columnheader(10) w lp ps 0.6 pt 0\

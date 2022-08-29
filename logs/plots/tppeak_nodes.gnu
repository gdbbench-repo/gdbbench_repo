set terminal svg size 300,200
set output "svgs/tppeak-nodes-total.svg"
set lt 1 lc rgb 'red'
set lt 2 lc rgb 'blue'
set lt 3 lc rgb 'green'
set boxwidth 0.8
set ylabel "Peak Throughput (K Txn/s)" offset 1,0
set xlabel "K Nodes in Graph" offset 0,0.5
set xtics nomirror

set logscale x
# set yrange [0:1.2]
set yrange [0:40]

set ls 1 lc rgb 'red'
set ls 2 lc rgb 'green'
set ls 3 lc rgb 'blue'
# set ls 4 lc rgb 'magenta'
# set key bottom
set key center at 900,7 spacing 0.7

plot  "dat_dir/tppeak_nodes_total.dat" using ($1/1000):($2/1000) t columnheader(2) w lp ps 0.6 pt 2\
    , "dat_dir/tppeak_nodes_total.dat" using ($1/1000):($3/1000) t columnheader(3) w lp ps 0.6 pt 10\
    , "dat_dir/tppeak_nodes_total.dat" using ($1/1000):($4/1000) t columnheader(4) w lp ps 0.6 pt 12

# set output "svgs/tppeak-nodes-range.svg"

# plot  "dat_dir/tppeak_nodes_GET_LINKS_LIST.dat" using ($1/1000):($2/1000) t columnheader(2) w lp ps 0.6 pt 2\
#     , "dat_dir/tppeak_nodes_GET_LINKS_LIST.dat" using ($1/1000):($3/1000) t columnheader(3) w lp ps 0.6 pt 10\
#     , "dat_dir/tppeak_nodes_GET_LINKS_LIST.dat" using ($1/1000):($4/1000) t columnheader(4) w lp ps 0.6 pt 12

# set output "svgs/tppeak-nodes-count.svg"

# plot  "dat_dir/tppeak_nodes_COUNT_LINK.dat" using ($1/1000):($2/1000) t columnheader(2) w lp ps 0.6 pt 2\
#     , "dat_dir/tppeak_nodes_COUNT_LINK.dat" using ($1/1000):($3/1000) t columnheader(3) w lp ps 0.6 pt 10\
#     , "dat_dir/tppeak_nodes_COUNT_LINK.dat" using ($1/1000):($4/1000) t columnheader(4) w lp ps 0.6 pt 12

# set output "svgs/tppeak-nodes-other.svg"

# plot  "dat_dir/tppeak_nodes_other.dat" using ($1/1000):($2/1000) t columnheader(2) w lp ps 0.6 pt 2\
#     , "dat_dir/tppeak_nodes_other.dat" using ($1/1000):($3/1000) t columnheader(3) w lp ps 0.6 pt 10\
#     , "dat_dir/tppeak_nodes_other.dat" using ($1/1000):($4/1000) t columnheader(4) w lp ps 0.6 pt 12

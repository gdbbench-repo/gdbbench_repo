set terminal svg size 300,200
set output "svgs/lateavg-rqsters-total.svg"
set lt 1 lc rgb 'red'
set lt 3 lc rgb 'green'
set lt 2 lc rgb 'blue'
set boxwidth 0.8
set ylabel "Average Latency (ms)" offset 2,0
set xlabel "Concurrent Requesters" offset 0,0.5
set xtics nomirror
# set yrange [0:1.6]

set ls 1 lc rgb 'red'
set ls 2 lc rgb 'green'
set ls 3 lc rgb 'blue'
# set ls 4 lc rgb 'magenta'
set key top left

plot  "dat_dir/lateavg_requesters_total.dat" using 1:($2/1000) t columnheader(2) w lp ps 0.6 pt 2\
    , "dat_dir/lateavg_requesters_total.dat" using 1:($3/1000) t columnheader(3) w lp ps 0.6 pt 10\
    , "dat_dir/lateavg_requesters_total.dat" using 1:($4/1000) t columnheader(4) w lp ps 0.6 pt 12

# set output "svgs/lateavg-rqsters-range.svg"

# plot  "dat_dir/lateavg_requesters_GET_LINKS_LIST.dat" using 1:($2/1000) t columnheader(2) w lp ps 0.6 pt 2\
#     , "dat_dir/lateavg_requesters_GET_LINKS_LIST.dat" using 1:($3/1000) t columnheader(3) w lp ps 0.6 pt 10\
#     , "dat_dir/lateavg_requesters_GET_LINKS_LIST.dat" using 1:($4/1000) t columnheader(4) w lp ps 0.6 pt 12

# set output "svgs/lateavg-rqsters-count.svg"

# plot  "dat_dir/lateavg_requesters_COUNT_LINK.dat" using 1:($2/1000) t columnheader(2) w lp ps 0.6 pt 2\
#     , "dat_dir/lateavg_requesters_COUNT_LINK.dat" using 1:($3/1000) t columnheader(3) w lp ps 0.6 pt 10\
#     , "dat_dir/lateavg_requesters_COUNT_LINK.dat" using 1:($4/1000) t columnheader(4) w lp ps 0.6 pt 12

# set output "svgs/lateavg-rqsters-other.svg"

# plot  "dat_dir/lateavg_requesters_other.dat" using 1:($2/1000) t columnheader(2) w lp ps 0.6 pt 2\
#     , "dat_dir/lateavg_requesters_other.dat" using 1:($3/1000) t columnheader(3) w lp ps 0.6 pt 10\
#     , "dat_dir/lateavg_requesters_other.dat" using 1:($4/1000) t columnheader(4) w lp ps 0.6 pt 12

set output "svgs/lateavg-rqsters-readonly.svg"

plot  "dat_dir/lateavg_requesters_readonly.dat" using 1:($2/1000) t columnheader(2) w lp ps 0.6 pt 2\
    , "dat_dir/lateavg_requesters_readonly.dat" using 1:($3/1000) t columnheader(3) w lp ps 0.6 pt 10\
    , "dat_dir/lateavg_requesters_readonly.dat" using 1:($4/1000) t columnheader(4) w lp ps 0.6 pt 12

set output "svgs/lateavg-rqsters-readwrite.svg"

plot  "dat_dir/lateavg_requesters_readwrite.dat" using 1:($2/1000) t columnheader(2) w lp ps 0.6 pt 2\
    , "dat_dir/lateavg_requesters_readwrite.dat" using 1:($3/1000) t columnheader(3) w lp ps 0.6 pt 10\
    , "dat_dir/lateavg_requesters_readwrite.dat" using 1:($4/1000) t columnheader(4) w lp ps 0.6 pt 12


# set output "svgs/lateavg-rqsters-COUNT_LINK.svg"

# plot  "dat_dir/lateavg_requesters_COUNT_LINK.dat" using 1:($2/1000) t columnheader(2) w lp ps 0.6 pt 2\
#     , "dat_dir/lateavg_requesters_COUNT_LINK.dat" using 1:($3/1000) t columnheader(3) w lp ps 0.6 pt 10\
#     , "dat_dir/lateavg_requesters_COUNT_LINK.dat" using 1:($4/1000) t columnheader(4) w lp ps 0.6 pt 12


# set output "svgs/lateavg-rqsters-ADD_LINK.svg"

# plot  "dat_dir/lateavg_requesters_ADD_LINK.dat" using 1:($2/1000) t columnheader(2) w lp ps 0.6 pt 2\
#     , "dat_dir/lateavg_requesters_ADD_LINK.dat" using 1:($3/1000) t columnheader(3) w lp ps 0.6 pt 10\
#     , "dat_dir/lateavg_requesters_ADD_LINK.dat" using 1:($4/1000) t columnheader(4) w lp ps 0.6 pt 12

# set output "svgs/lateavg-rqsters-ADD_NODE.svg"

# plot  "dat_dir/lateavg_requesters_ADD_NODE.dat" using 1:($2/1000) t columnheader(2) w lp ps 0.6 pt 2\
#     , "dat_dir/lateavg_requesters_ADD_NODE.dat" using 1:($3/1000) t columnheader(3) w lp ps 0.6 pt 10\
#     , "dat_dir/lateavg_requesters_ADD_NODE.dat" using 1:($4/1000) t columnheader(4) w lp ps 0.6 pt 12

# set output "svgs/lateavg-rqsters-DELETE_LINK.svg"

# plot  "dat_dir/lateavg_requesters_DELETE_LINK.dat" using 1:($2/1000) t columnheader(2) w lp ps 0.6 pt 2\
#     , "dat_dir/lateavg_requesters_DELETE_LINK.dat" using 1:($3/1000) t columnheader(3) w lp ps 0.6 pt 10\
#     , "dat_dir/lateavg_requesters_DELETE_LINK.dat" using 1:($4/1000) t columnheader(4) w lp ps 0.6 pt 12

# set output "svgs/lateavg-rqsters-DELETE_NODE.svg"

# plot  "dat_dir/lateavg_requesters_DELETE_NODE.dat" using 1:($2/1000) t columnheader(2) w lp ps 0.6 pt 2\
#     , "dat_dir/lateavg_requesters_DELETE_NODE.dat" using 1:($3/1000) t columnheader(3) w lp ps 0.6 pt 10\
#     , "dat_dir/lateavg_requesters_DELETE_NODE.dat" using 1:($4/1000) t columnheader(4) w lp ps 0.6 pt 12

# set output "svgs/lateavg-rqsters-GET_LINKS_LIST.svg"

# plot  "dat_dir/lateavg_requesters_GET_LINKS_LIST.dat" using 1:($2/1000) t columnheader(2) w lp ps 0.6 pt 2\
#     , "dat_dir/lateavg_requesters_GET_LINKS_LIST.dat" using 1:($3/1000) t columnheader(3) w lp ps 0.6 pt 10\
#     , "dat_dir/lateavg_requesters_GET_LINKS_LIST.dat" using 1:($4/1000) t columnheader(4) w lp ps 0.6 pt 12

# set output "svgs/lateavg-rqsters-GET_NODE.svg"

# plot  "dat_dir/lateavg_requesters_GET_NODE.dat" using 1:($2/1000) t columnheader(2) w lp ps 0.6 pt 2\
#     , "dat_dir/lateavg_requesters_GET_NODE.dat" using 1:($3/1000) t columnheader(3) w lp ps 0.6 pt 10\
#     , "dat_dir/lateavg_requesters_GET_NODE.dat" using 1:($4/1000) t columnheader(4) w lp ps 0.6 pt 12

# set output "svgs/lateavg-rqsters-MULTIGET_LINK.svg"

# plot  "dat_dir/lateavg_requesters_MULTIGET_LINK.dat" using 1:($2/1000) t columnheader(2) w lp ps 0.6 pt 2\
#     , "dat_dir/lateavg_requesters_MULTIGET_LINK.dat" using 1:($3/1000) t columnheader(3) w lp ps 0.6 pt 10\
#     , "dat_dir/lateavg_requesters_MULTIGET_LINK.dat" using 1:($4/1000) t columnheader(4) w lp ps 0.6 pt 12

# set output "svgs/lateavg-rqsters-UPDATE_LINK.svg"

# plot  "dat_dir/lateavg_requesters_UPDATE_LINK.dat" using 1:($2/1000) t columnheader(2) w lp ps 0.6 pt 2\
#     , "dat_dir/lateavg_requesters_UPDATE_LINK.dat" using 1:($3/1000) t columnheader(3) w lp ps 0.6 pt 10\
#     , "dat_dir/lateavg_requesters_UPDATE_LINK.dat" using 1:($4/1000) t columnheader(4) w lp ps 0.6 pt 12

# set output "svgs/lateavg-rqsters-UPDATE_NODE.svg"

# plot  "dat_dir/lateavg_requesters_UPDATE_NODE.dat" using 1:($2/1000) t columnheader(2) w lp ps 0.6 pt 2\
#     , "dat_dir/lateavg_requesters_UPDATE_NODE.dat" using 1:($3/1000) t columnheader(3) w lp ps 0.6 pt 10\
#     , "dat_dir/lateavg_requesters_UPDATE_NODE.dat" using 1:($4/1000) t columnheader(4) w lp ps 0.6 pt 12
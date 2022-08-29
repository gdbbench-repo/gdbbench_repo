set terminal svg size 300,200
set output "svgs/tppeak-rqsters-total.svg"
set lt 1 lc rgb 'red'
set lt 3 lc rgb 'green'
set lt 2 lc rgb 'blue'
set boxwidth 0.8
set ylabel "Peak Throughput (K Txn/s)" offset 1,0
set xlabel "Concurrent Requesters" offset 0,0.5
set xtics nomirror
# set yrange [0:1.6]
set yrange [0:65]

set ls 1 lc rgb 'red'
set ls 2 lc rgb 'green'
set ls 3 lc rgb 'blue'
# set ls 4 lc rgb 'magenta'
# set key bottom
set key center at 65,15 spacing 0.7

plot  "dat_dir/tppeak_requesters_total.dat" using 1:($2/1000) t columnheader(2) w lp ps 0.6 pt 2\
    , "dat_dir/tppeak_requesters_total.dat" using 1:($3/1000) t columnheader(3) w lp ps 0.6 pt 10\
    , "dat_dir/tppeak_requesters_total.dat" using 1:($4/1000) t columnheader(4) w lp ps 0.6 pt 12

# set output "svgs/tppeak-rqsters-range.svg"

# plot  "dat_dir/tppeak_requesters_GET_LINKS_LIST.dat" using 1:($2/1000) t columnheader(2) w lp ps 0.6 pt 2\
#     , "dat_dir/tppeak_requesters_GET_LINKS_LIST.dat" using 1:($3/1000) t columnheader(3) w lp ps 0.6 pt 10\
#     # , "dat_dir/tppeak_requesters_GET_LINKS_LIST.dat" using 1:($4/1000) t columnheader(4) w lp ps 0.6 pt 12

# set output "svgs/tppeak-rqsters-count.svg"

# plot  "dat_dir/tppeak_requesters_COUNT_LINK.dat" using 1:($2/1000) t columnheader(2) w lp ps 0.6 pt 2\
#     , "dat_dir/tppeak_requesters_COUNT_LINK.dat" using 1:($3/1000) t columnheader(3) w lp ps 0.6 pt 10\
#     # , "dat_dir/tppeak_requesters_COUNT_LINK.dat" using 1:($4/1000) t columnheader(4) w lp ps 0.6 pt 12

# set output "svgs/tppeak-rqsters-other.svg"

# plot  "dat_dir/tppeak_requesters_other.dat" using 1:($2/1000) t columnheader(2) w lp ps 0.6 pt 2\
#     , "dat_dir/tppeak_requesters_other.dat" using 1:($3/1000) t columnheader(3) w lp ps 0.6 pt 10\
#     # , "dat_dir/tppeak_requesters_other.dat" using 1:($4/1000) t columnheader(4) w lp ps 0.6 pt 12
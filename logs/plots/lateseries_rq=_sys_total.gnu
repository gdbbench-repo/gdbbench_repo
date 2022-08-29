set terminal svg size 300,200
set lt 1 lc rgb 'red'
set lt 3 lc rgb 'green'
set lt 2 lc rgb 'blue'
set boxwidth 0.8
set ylabel "Latency (ms)" offset 2,0
set xlabel "Time (s)" offset 0,0.5
set xtics nomirror

set ls 1 lc rgb 'red'
set ls 2 lc rgb 'green'
set ls 3 lc rgb 'blue'
set key left top

# set xrange [0:260]
datprefix = "dat_dir/lateseries_requesters=80_sysname_"
svgprefix = "svgs/lateseries-rq80-sysname-"

set xrange[0:400]
set output svgprefix."total.svg"
plot  datprefix."total.dat" using ($1/1000):($2/1000) t columnheader(2) w lp ps 0.6 pt 0\
    , datprefix."total.dat" using ($1/1000):($3/1000) t columnheader(3) w lp ps 0.6 pt 0\
    , datprefix."total.dat" using ($1/1000):($4/1000) t columnheader(4) w lp ps 0.6 pt 0\

set output svgprefix."other.svg"
plot  datprefix."other.dat" using ($1/1000):($2/1000) t columnheader(2) w lp ps 0.6 pt 0\
    , datprefix."other.dat" using ($1/1000):($3/1000) t columnheader(3) w lp ps 0.6 pt 0\
    , datprefix."other.dat" using ($1/1000):($4/1000) t columnheader(4) w lp ps 0.6 pt 0\

set output svgprefix."range.svg"
plot  datprefix."GET_LINKS_LIST.dat" using ($1/1000):($2/1000) t columnheader(2) w lp ps 0.6 pt 0\
    , datprefix."GET_LINKS_LIST.dat" using ($1/1000):($3/1000) t columnheader(3) w lp ps 0.6 pt 0\
    , datprefix."GET_LINKS_LIST.dat" using ($1/1000):($4/1000) t columnheader(4) w lp ps 0.6 pt 0\

set output svgprefix."count.svg"
plot  datprefix."COUNT_LINK.dat" using ($1/1000):($2/1000) t columnheader(2) w lp ps 0.6 pt 0\
    , datprefix."COUNT_LINK.dat" using ($1/1000):($3/1000) t columnheader(3) w lp ps 0.6 pt 0\
    , datprefix."COUNT_LINK.dat" using ($1/1000):($4/1000) t columnheader(4) w lp ps 0.6 pt 0\


datprefix = "dat_dir/lateseries_requesters=90_sysname_"
svgprefix = "svgs/lateseries-rq90-sysname-"
set xrange[0:500]
set output svgprefix."total.svg"
plot  datprefix."total.dat" using ($1/1000):($2/1000) t columnheader(2) w lp ps 0.6 pt 0\
    , datprefix."total.dat" using ($1/1000):($3/1000) t columnheader(3) w lp ps 0.6 pt 0\
    , datprefix."total.dat" using ($1/1000):($4/1000) t columnheader(4) w lp ps 0.6 pt 0\

set output svgprefix."other.svg"
plot  datprefix."other.dat" using ($1/1000):($2/1000) t columnheader(2) w lp ps 0.6 pt 0\
    , datprefix."other.dat" using ($1/1000):($3/1000) t columnheader(3) w lp ps 0.6 pt 0\
    , datprefix."other.dat" using ($1/1000):($4/1000) t columnheader(4) w lp ps 0.6 pt 0\

set output svgprefix."range.svg"
plot  datprefix."GET_LINKS_LIST.dat" using ($1/1000):($2/1000) t columnheader(2) w lp ps 0.6 pt 0\
    , datprefix."GET_LINKS_LIST.dat" using ($1/1000):($3/1000) t columnheader(3) w lp ps 0.6 pt 0\
    , datprefix."GET_LINKS_LIST.dat" using ($1/1000):($4/1000) t columnheader(4) w lp ps 0.6 pt 0\

set output svgprefix."count.svg"
plot  datprefix."COUNT_LINK.dat" using ($1/1000):($2/1000) t columnheader(2) w lp ps 0.6 pt 0\
    , datprefix."COUNT_LINK.dat" using ($1/1000):($3/1000) t columnheader(3) w lp ps 0.6 pt 0\
    , datprefix."COUNT_LINK.dat" using ($1/1000):($4/1000) t columnheader(4) w lp ps 0.6 pt 0\


datprefix = "dat_dir/lateseries_requesters=70_sysname_"
svgprefix = "svgs/lateseries-rq70-sysname-"
set xrange[0:300]
set output svgprefix."total.svg"
plot  datprefix."total.dat" using ($1/1000):($2/1000) t columnheader(2) w lp ps 0.6 pt 0\
    , datprefix."total.dat" using ($1/1000):($3/1000) t columnheader(3) w lp ps 0.6 pt 0\
    , datprefix."total.dat" using ($1/1000):($4/1000) t columnheader(4) w lp ps 0.6 pt 0\

set output svgprefix."other.svg"
plot  datprefix."other.dat" using ($1/1000):($2/1000) t columnheader(2) w lp ps 0.6 pt 0\
    , datprefix."other.dat" using ($1/1000):($3/1000) t columnheader(3) w lp ps 0.6 pt 0\
    , datprefix."other.dat" using ($1/1000):($4/1000) t columnheader(4) w lp ps 0.6 pt 0\

set output svgprefix."range.svg"
plot  datprefix."GET_LINKS_LIST.dat" using ($1/1000):($2/1000) t columnheader(2) w lp ps 0.6 pt 0\
    , datprefix."GET_LINKS_LIST.dat" using ($1/1000):($3/1000) t columnheader(3) w lp ps 0.6 pt 0\
    , datprefix."GET_LINKS_LIST.dat" using ($1/1000):($4/1000) t columnheader(4) w lp ps 0.6 pt 0\

set output svgprefix."count.svg"
plot  datprefix."COUNT_LINK.dat" using ($1/1000):($2/1000) t columnheader(2) w lp ps 0.6 pt 0\
    , datprefix."COUNT_LINK.dat" using ($1/1000):($3/1000) t columnheader(3) w lp ps 0.6 pt 0\
    , datprefix."COUNT_LINK.dat" using ($1/1000):($4/1000) t columnheader(4) w lp ps 0.6 pt 0\


set xrange[0:280]
datprefix = "dat_dir/lateseries_requesters=60_sysname_"
svgprefix = "svgs/lateseries-rq60-sysname-"
set output svgprefix."total.svg"
plot  datprefix."total.dat" using ($1/1000):($2/1000) t columnheader(2) w lp ps 0.6 pt 0\
    , datprefix."total.dat" using ($1/1000):($3/1000) t columnheader(3) w lp ps 0.6 pt 0\
    , datprefix."total.dat" using ($1/1000):($4/1000) t columnheader(4) w lp ps 0.6 pt 0\

set output svgprefix."other.svg"
plot  datprefix."other.dat" using ($1/1000):($2/1000) t columnheader(2) w lp ps 0.6 pt 0\
    , datprefix."other.dat" using ($1/1000):($3/1000) t columnheader(3) w lp ps 0.6 pt 0\
    , datprefix."other.dat" using ($1/1000):($4/1000) t columnheader(4) w lp ps 0.6 pt 0\

set output svgprefix."range.svg"
plot  datprefix."GET_LINKS_LIST.dat" using ($1/1000):($2/1000) t columnheader(2) w lp ps 0.6 pt 0\
    , datprefix."GET_LINKS_LIST.dat" using ($1/1000):($3/1000) t columnheader(3) w lp ps 0.6 pt 0\
    , datprefix."GET_LINKS_LIST.dat" using ($1/1000):($4/1000) t columnheader(4) w lp ps 0.6 pt 0\

set output svgprefix."count.svg"
plot  datprefix."COUNT_LINK.dat" using ($1/1000):($2/1000) t columnheader(2) w lp ps 0.6 pt 0\
    , datprefix."COUNT_LINK.dat" using ($1/1000):($3/1000) t columnheader(3) w lp ps 0.6 pt 0\
    , datprefix."COUNT_LINK.dat" using ($1/1000):($4/1000) t columnheader(4) w lp ps 0.6 pt 0\

set xrange[0:900]
set key spacing 0.8
set xtics 200
datprefix = "dat_dir/lateseries_requesters=80_sysname_"
svgprefix = "svgs/lateseries-rq80-sysname-"
set output svgprefix."total-rq40w.svg"
plot  datprefix."total_withrqsts=40w.dat" using ($1/1000):($2/1000) t columnheader(2) w lp ps 0.6 pt 0\
    , datprefix."total_withrqsts=40w.dat" using ($1/1000):($3/1000) t columnheader(3) w lp ps 0.6 pt 0\
    , datprefix."total_withrqsts=40w.dat" using ($1/1000):($4/1000) t columnheader(4) w lp ps 0.6 pt 0\

set output svgprefix."other-rq40w.svg"
plot  datprefix."other_withrqsts=40w.dat" using ($1/1000):($2/1000) t columnheader(2) w lp ps 0.6 pt 0\
    , datprefix."other_withrqsts=40w.dat" using ($1/1000):($3/1000) t columnheader(3) w lp ps 0.6 pt 0\
    , datprefix."other_withrqsts=40w.dat" using ($1/1000):($4/1000) t columnheader(4) w lp ps 0.6 pt 0\

set output svgprefix."range-rq40w.svg"
plot  datprefix."GET_LINKS_LIST_withrqsts=40w.dat" using ($1/1000):($2/1000) t columnheader(2) w lp ps 0.6 pt 0\
    , datprefix."GET_LINKS_LIST_withrqsts=40w.dat" using ($1/1000):($3/1000) t columnheader(3) w lp ps 0.6 pt 0\
    , datprefix."GET_LINKS_LIST_withrqsts=40w.dat" using ($1/1000):($4/1000) t columnheader(4) w lp ps 0.6 pt 0\

set output svgprefix."count-rq40w.svg"
plot  datprefix."COUNT_LINK_withrqsts=40w.dat" using ($1/1000):($2/1000) t columnheader(2) w lp ps 0.6 pt 0\
    , datprefix."COUNT_LINK_withrqsts=40w.dat" using ($1/1000):($3/1000) t columnheader(3) w lp ps 0.6 pt 0\
    , datprefix."COUNT_LINK_withrqsts=40w.dat" using ($1/1000):($4/1000) t columnheader(4) w lp ps 0.6 pt 0\

# set output "svgs/lateseries-rq80-sysname-total-rq40w.svg"
# plot  "dat_dir/lateseries_requesters=80_sysname_total_withrqsts=40w.dat" using ($1/1000):($2/1000) t columnheader(2) w lp ps 0.6 pt 0\
#     , "dat_dir/lateseries_requesters=80_sysname_total_withrqsts=40w.dat" using ($1/1000):($3/1000) t columnheader(3) w lp ps 0.6 pt 0\

# set output "svgs/lateseries-rq80-sysname-other-rq40w.svg"
# plot  "dat_dir/lateseries_requesters=80_sysname_other_withrqsts=40w.dat" using ($1/1000):($2/1000) t columnheader(2) w lp ps 0.6 pt 0\
#     , "dat_dir/lateseries_requesters=80_sysname_other_withrqsts=40w.dat" using ($1/1000):($3/1000) t columnheader(3) w lp ps 0.6 pt 0\

# set output "svgs/lateseries-rq80-sysname-range-rq40w.svg"
# plot  "dat_dir/lateseries_requesters=80_sysname_GET_LINKS_LIST_withrqsts=40w.dat" using ($1/1000):($2/1000) t columnheader(2) w lp ps 0.6 pt 0\
#     , "dat_dir/lateseries_requesters=80_sysname_GET_LINKS_LIST_withrqsts=40w.dat" using ($1/1000):($3/1000) t columnheader(3) w lp ps 0.6 pt 0\

# set output "svgs/lateseries-rq80-sysname-count-rq40w.svg"
# plot  "dat_dir/lateseries_requesters=80_sysname_COUNT_LINK_withrqsts=40w.dat" using ($1/1000):($2/1000) t columnheader(2) w lp ps 0.6 pt 0\
#     , "dat_dir/lateseries_requesters=80_sysname_COUNT_LINK_withrqsts=40w.dat" using ($1/1000):($3/1000) t columnheader(3) w lp ps 0.6 pt 0\

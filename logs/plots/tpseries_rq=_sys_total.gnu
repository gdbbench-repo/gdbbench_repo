set terminal svg size 300,200
set lt 1 lc rgb 'red'
set lt 3 lc rgb 'green'
set lt 2 lc rgb 'blue'
set boxwidth 0.8
set ylabel "Throughput (K Txn/s)" offset 1,0
set xlabel "Time (s)" offset 0,0.5
set xtics nomirror

set ls 1 lc rgb 'red'
set ls 2 lc rgb 'green'
set ls 3 lc rgb 'blue'
# set key bottom
set key top

# set xrange [0:260]

svgprefix="svgs/tpseries-rq"
datprefix="dat_dir/tpseries_requesters="
svgappendix="-sysname-total.svg"
datappendix="_sysname_total.dat"


set xrange [0:500]
rqsters="80"
set output svgprefix.rqsters.svgappendix
plot  datprefix.rqsters.datappendix using ($1/1000):($2/1000) t columnheader(2) w lp ps 0.6 pt 0\
    , datprefix.rqsters.datappendix using ($1/1000):($3/1000) t columnheader(3) w lp ps 0.6 pt 0\
    , datprefix.rqsters.datappendix using ($1/1000):($4/1000) t columnheader(4) w lp ps 0.6 pt 0\

unset xrange


rqsters="90"
set output svgprefix.rqsters.svgappendix
plot  datprefix.rqsters.datappendix using ($1/1000):($2/1000) t columnheader(2) w lp ps 0.6 pt 0\
    , datprefix.rqsters.datappendix using ($1/1000):($3/1000) t columnheader(3) w lp ps 0.6 pt 0\
    , datprefix.rqsters.datappendix using ($1/1000):($4/1000) t columnheader(4) w lp ps 0.6 pt 0\


rqsters="70"
set output svgprefix.rqsters.svgappendix
plot  datprefix.rqsters.datappendix using ($1/1000):($2/1000) t columnheader(2) w lp ps 0.6 pt 0\
    , datprefix.rqsters.datappendix using ($1/1000):($3/1000) t columnheader(3) w lp ps 0.6 pt 0\
    , datprefix.rqsters.datappendix using ($1/1000):($4/1000) t columnheader(4) w lp ps 0.6 pt 0\


rqsters="60"
set output svgprefix.rqsters.svgappendix
plot  datprefix.rqsters.datappendix using ($1/1000):($2/1000) t columnheader(2) w lp ps 0.6 pt 0\
    , datprefix.rqsters.datappendix using ($1/1000):($3/1000) t columnheader(3) w lp ps 0.6 pt 0\
    , datprefix.rqsters.datappendix using ($1/1000):($4/1000) t columnheader(4) w lp ps 0.6 pt 0\

svgappendix="-sysname-total-rq40w.svg"
datappendix="_sysname_total_withrqsts=40w.dat"
rqsters="80"
set xrange [0:900]
set xtics 200
set output svgprefix.rqsters.svgappendix
plot  datprefix.rqsters.datappendix using ($1/1000):($2/1000) t columnheader(2) w lp ps 0.6 pt -1\
    , datprefix.rqsters.datappendix using ($1/1000):($3/1000) t columnheader(3) w lp ps 0.6 pt -1\
    , datprefix.rqsters.datappendix using ($1/1000):($4/1000) t columnheader(4) w lp ps 0.6 pt -1\

#! /bin/bash

rm -f svgs/*.svg
rm -f svgs/*.pdf

gnuplot plots/abort_node.gnu
gnuplot plots/abort_rqster.gnu
# gnuplot plots/tppeak_nodes.gnu
gnuplot plots/tppeak_rqster.gnu
gnuplot plots/lateavg_node.gnu
gnuplot plots/lateavg_rqster.gnu
gnuplot plots/tpseries_rq=_sys_total.gnu
gnuplot plots/lateseries_rq=_sys_total.gnu

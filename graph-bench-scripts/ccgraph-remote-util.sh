if [ "${rhost}" = "" ]; then
echo "WARNING: no rhost specified. use val10 by default"
rhost=val10
else
echo "RESETING ccgraph on ${rhost}"
fi
this_sh=`realpath $0`
this_path=${this_sh%/*}

ssh $rhost "$this_path/ccgraph_util.sh $@"
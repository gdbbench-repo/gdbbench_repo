if [ "${rhost}" = "" ]; then
echo "WARNING: no rhost specified. use val06 by default"
rhost=val06
fi
this_sh=`realpath $0`
this_path=${this_sh%/*}

ssh $rhost "rm -rf ${this_path}/../generated_data"
scp -r $this_path/../generated_data $rhost:$this_path/../
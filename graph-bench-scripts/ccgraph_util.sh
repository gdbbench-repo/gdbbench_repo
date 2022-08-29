#!/bin/bash
source ~/.sxn_envs
config_name=$2
start() {
    echo $'ping\nexit' | /home/sxn/ccgraph/Release/CCGraphClient /home/sxn/ccgraph/$config_name.cnf 1>/dev/null 2>&1
    retVal=$?
    if [ $retVal -eq 0 ]; then
        echo "CCGraph server already started, I don't launch it"
    else
        nohup /home/sxn/ccgraph/Release/CCGraphPoolServer /home/sxn/ccgraph/$config_name.cnf 1>~/nohup_$config_name.out 2>&1 &
        echo "CCGraph server[$config_name] starting"
        wait_online
        echo "CCGraph server[$config_name] is online"
    fi
}

wait_online() {
    retVal=1
    while [ $retVal -ne 0 ]
    do
        echo $'ping\nexit' | /home/sxn/ccgraph/Release/CCGraphClient /home/sxn/ccgraph/$config_name.cnf 1>/dev/null 2>&1
        retVal=$?
        sleep 1
        tail -2 ~/nohup_$config_name.out
    done
}

stop() {
    # code to stop app comes here 
    # example: killproc program_name
    echo $'ping\nshutdown' | /home/sxn/ccgraph/Release/CCGraphClient /home/sxn/ccgraph/$config_name.cnf 1>/dev/null 2>&1
    retVal=$?
    if [ $retVal -ne 0 ]; then
        echo "CCGraph server not started"
    else
        echo "CCGraph server stopped"
    fi
}

status() {
    echo $'ping\nexit' | /home/sxn/ccgraph/Release/CCGraphClient /home/sxn/ccgraph/$config_name.cnf 1>/dev/null 2>&1
    retVal=$?
    if [ $retVal -ne 0 ]; then
        echo "CCGraph server not ready"
    else
        echo "CCGraph server running"
    fi
}

case "$1" in 
    start)
        start
        ;;
    stop)
        stop
        ;;
    wait_online)
        wait_online
        ;;
    restart)
        stop
        start
        ;;
    status)
        # code to check status of app comes here 
        # example: status program_name
        status
        ;;
    *)
        echo "Usage: $0 {start|stop|status|restart} <configfile>"
esac

exit 0 
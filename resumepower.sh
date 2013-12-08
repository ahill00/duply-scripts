#!/bin/bash

logger "Called resumepower.sh with params $0 $1 $2"
case $1 in
    resume)
    # Wait for Network to be available.
    while true
    do
    logger "Checking internet connectivity..."
    ping -c 1 8.8.8.8 > /dev/null
    if [[ $? == 0 ]];
    then
        logger "Internet connectivity detected, running duply"
        sudo su - %u -c "export DISPLAY=:0 && nohup duply swift backup > /home/%u/swift.backup &"
        break;
    else
        logger "Waiting for internet connectivity..."
        sleep 15
    fi
    done
    ;;
esac

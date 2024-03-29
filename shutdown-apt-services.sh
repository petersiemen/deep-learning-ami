#!/usr/bin/env bash

set -e

function killService() {
    service=$1
    sudo systemctl stop $service

    # Wait until the status of the service is either exited or killed.
    while ! (sudo systemctl status "$service" | grep -q "inactive")
    do
        sleep 10
        echo "sudo systemctl status $service | grep -q "inactive"          returned not successful. Trying again"
    done
}

function disableTimers() {
    sudo systemctl disable apt-daily.timer
    sudo systemctl disable apt-daily-upgrade.timer
}

function killServices() {
    killService unattended-upgrades.service
    killService apt-daily.service
    killService apt-daily-upgrade.service
}

function main() {
    disableTimers
    killServices
}

main

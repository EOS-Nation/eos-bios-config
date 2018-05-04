#!/bin/bash

# `boot_node` hook
# $1 genesis JSON
# $2 ephemeral public key
# $3 ephemeral private key
#
# This process must not BLOCK.

echo "Copying base config"
cp base_config.ini config.ini

echo "Writing genesis.json"
echo $1 > genesis.json

echo "producer-name = eosio" >> config.ini
echo "enable-stale-production = true" >> config.ini
echo "private-key = [\"$2\",\"$3\"]" >> config.ini

echo "Killing running nodes"
systemctl stop nodeos.service

echo "Removing old nodeos data (you might be asked for your sudo password)..."
rm -rf ../data

echo "Running 'nodeos' through systemd"
systemctl start nodeos.service

echo ""
echo "   View logs with: journalctl -u nodeos.service"
echo ""

echo "Waiting 3 secs for nodeos to launch through systemd"
sleep 3

echo "Hit ENTER to continue"
read

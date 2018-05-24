#!/bin/bash -e

# `boot_node` hook
# $1 genesis JSON
# $2 ephemeral public key
# $3 ephemeral private key
#
# This process must not BLOCK.

echo "Copying base config"
cp config/base_config.ini config/config.ini

echo "Writing genesis.json"
echo $1 > config/genesis.json

echo "producer-name = eosio" >> config/config.ini
echo "enable-stale-production = true" >> config/config.ini
echo "private-key = [\"$2\",\"$3\"]" >> config/config.ini

echo "Removing old nodeos data (you might be asked for your sudo password)..."
# TO-DO rm docker volume
# sudo rm -rf /tmp/nodeos-data

echo "Running 'nodeos' through Docker."
docker-compose up -d

echo ""
echo "   View logs with: docker-compose logs -f"
echo ""

echo "Waiting 3 secs for nodeos to launch through Docker"
sleep 3

echo "Hit ENTER to continue"
read
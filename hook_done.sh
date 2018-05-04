#!/bin/bash

# `done` hook
# $1 = operation ("join", "boot" or "orchestrate")

echo "All done, anything else you want to do ? Call regproducer?"
echo ""
echo "Don't forget to view your logs with:"
echo "   journalctl -u nodeos.service"
echo ""
echo "Kill your node with:"
echo "   systemctl stop nodeos.service"
echo ""

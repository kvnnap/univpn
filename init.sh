#!/bin/bash

echo "Starting up tunnel interface.."
wg-quick up client

echo "Starting up crond"
crond -f -l 2

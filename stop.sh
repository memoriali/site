#!/bin/bash
#
# cipdemoweb stop.sh script
#
docker stop $(docker ps -q --filter ancestor=cipdemoweb)
#
#
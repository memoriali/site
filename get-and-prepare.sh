#!/bin/bash
#####################################################################
# ATTENTION! Move this file 1 level UP from the current directory!  #
#####################################################################
# Cleanup old GIT directory:
rm -rf ./site
#
# Download fresh copy from GIT:
git clone https://github.com/memoriali/site
#
# Adjust settings for PROD environment:
#
sed -i -- 's/^app\.run/#&/' ./site/www/index.py
#
sed -i -- 's/c:\/tmp\/cache\.pdb/\/cache\/cache\.pdb/g' ./site/www/dataloader.py
#
chmod 777 ./site/run
chmod 777 ./site/stop
#

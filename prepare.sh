#!/bin/bash
#
# Adjust settings for PROD environment:
#
sed -i -- 's/^app\.run/#&/' ./www/index.py
#
sed -i -- 's/c:\/tmp\/cache\.pdb/\/cache\/cache\.pdb/g' ./www/dataloader.py
#

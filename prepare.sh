#!/bin/bash
#
# Adjust settings for PROD environment:
#
sed -i -- 's/^app\.run/#&/' ./www/index.py
#
sed -i -- 's/c:\/tmp\/cache\.pdb/\/cache\/cache\.pdb/g' ./www/dataloader.py
#
#
## The following values are just samples:
#
# Default Test Latvian token
sed -i -- 's/#AUTHTOKEN#/6410c5e5-c0fb-4633-a30d-c8d70d3c53d9/g' ./www/dataloader.py
# Default test Latvia ID
sed -i -- 's/#COUNTRYID#/c-1/g' ./www/dataloader.py
# Default test REST Service address
sed -i -- 's/#RESTSERVICEADDRESS#/ciprest.memoriali.org/g' ./www/dataloader.py
#

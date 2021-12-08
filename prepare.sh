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
# Default Test Region token
sed -i -- 's/#AUTHTOKEN#/547cfc9c-21b0-4309-a4e2-d1c945856dd9/g' ./www/dataloader.py
# Default test Region ID
sed -i -- 's/#COUNTRYID#/c-16/g' ./www/dataloader.py
# Default test REST Service address
sed -i -- 's/#RESTSERVICEADDRESS#/ciprest.memoriali.org/g' ./www/dataloader.py
#

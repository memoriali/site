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
sed -i -- 's/#AUTHTOKEN#/547cfc9c-21b0-4309-a4e2-d1c945856dd9/g' ./www/tpl/map.html
# Default test Region ID
sed -i -- 's/#COUNTRYID#/c-16/g' ./www/dataloader.py
sed -i -- 's/#COUNTRYID#/c-16/g' ./www/tpl/map.html
# Default test REST Service address
sed -i -- 's/#RESTSERVICEADDRESS#/ciprest.memoriali.org/g' ./www/dataloader.py
#
# Using Map
sed -i -- 's/your_app_id/your_app_id/g' ./www/tpl/map.html
sed -i -- 's/your_app_code/your_app_code/g' ./www/tpl/map.html
# Sample Map center
sed -i -- 's/#MAPCENTER#/56.974325, 24.699127/g' ./www/tpl/map.html


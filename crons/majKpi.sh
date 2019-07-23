#!/bin/sh
cd /var/www/vhosts/mobilestock.fr/test-gt.mobilestock.fr


php symfony exportKPIRetard $(date -d "20 days ago" "+%Y-%m-%d") $(date +%Y-%m-%d) > /dev/null 2>&1
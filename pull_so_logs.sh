#! /bin/bash

#
# Pulll security onion torrent logs 
#

# set year

year=2014

# set months

months=( 09 08 07 06 05 04 03 02 01)

# Save sumary output to this file

log=soDownloads.txt
rm -f $log
touch $log

# pull logs


for month in ${months[@]}; do

    # pull logs

    wget -nc http://port111.com/webalizer/usage_$year$month.html

    # convert to ascii

    html2text -width 120 -nobs -ascii usage_$year$month.html > usage_$year$month.txt

    # extract hits

    cat usage_$year$month.txt  | sed -e '/By_kB/,$d;1,/Total_URLs/d;s/_//g' | grep -i onion | grep \| | cut -d\| -f3,11 | sed -e "s/^/$year$month\|/; s/^/\|/; s/$/\|/"  | tee $log

    # clean up

    rm -f usage_$year$month.html usage_$year$month.txt

    
done




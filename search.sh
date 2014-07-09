#!/bin/bash


PARTNUMBER=$1

#Toggle between these to enable and disable Lead Free / RoHS selections
#SITE="http://www.digikey.com/product-search/en?x=0&y=0&lang=en&site=us&KeyWords=$PARTNUMBER&pbfree=1&rohs=1"
SITE="http://www.digikey.com/product-search/en?x=0&y=0&lang=en&site=us&KeyWords=$PARTNUMBER"



#use wget or cURL to extract source html:
#wget -q -O digikeypart.html --user-agent="User-Agent:" $SITE
curl -s -o digikeypart.html -A "User-Agent:" -O $SITE



#call rohs.sh to parse text for compliance:
source rohs.sh $PARTNUMBER

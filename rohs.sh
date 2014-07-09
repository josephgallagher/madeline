#!/bin/bash

PARTNUMBER=$1
file=digikeypart.html
RoHS_1="href=\"javascript:msgBox('#dlgRohs');"
RoHS_2="Lead Free Status / RoHS Status</th><td>Lead free / RoHS Compliant"
nRoHS="alt=\"This part is RoHS non-compliant.\" title=\"This part is RoHS non-compliant."

#test for existence of the html file
if [ -f $file ]
then

	#read through the file looking for the P/N
	#while read line
	#do

		# e.g)	if [[ `grep "text to find" $file ` ]]; then
		if [[ `grep "$RoHS_1\|$RoHS_2" $file` ]] && [ $? == 0 ]; then
			printf "%-30s  %-5s = %-5s\n" $PARTNUMBER RoHS YES

		elif [[ `grep "$nRoHS" $file` ]]; then
			printf "%-30s  %-5s = %-5s %-5s\n" $PARTNUMBER RoHS NO: "Substitutes Available"


		elif [[ `grep "No records match your search criteria" $file` ]]; then
			printf "%-30s  %-5s = %-5s %-5s\n" $PARTNUMBER RoHS NO: "P/N Does Not Exist" 
		

		elif [[ `grep "Results matching criteria" $file` ]]; then
			printf "%-30s  %-5s  %-5s\n" $PARTNUMBER Multiple Matches

		fi
		

		
	#done < $file
fi





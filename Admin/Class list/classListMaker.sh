#!/bin/bash
infile="$1"
outfile="htmlFile.html"
while IFS='' read -r line || [[ -n "$line" ]]; do
   #	if [ $line ?? "<html" ]; then echo $line > $outfile fi
#	if [ $line ?? "<title" ]; then echo $line >> $outfile fi
#	if [ $line ?? "<body" ]; then echo $line >> $outfile fi
#	if [ $line ?? "<</div></div><h3>All participants" ]; then 
#		echo "<table>" >> $outfile 
#		#While loop to read line by line
#		while read -r line
#		do
    			readLine=$line
    			#If the line starts with ST then echo the line
    			if [[ $readLine = "<td*" ]] ; then
				echo "$readLine"
        			echo "$readLine" >> $outfile
        			read line
        			readLine=$line
        			if [[ $readLine = "</table>" ]] ; then
            				echo "$readLine" >> $outfile
        			fi
    			fi
#		done #done < "$infile" 
#	fi

	if [ $line ?? "</html" ]; then echo $line >> $outfile fi
	# echo "Text read from file: $line"
done < "$infile"


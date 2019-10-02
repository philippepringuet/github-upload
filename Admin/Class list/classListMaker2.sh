#!/bin/bash
infile=$1
outfile='htmlFile.html'
n=1
insidetable=0
nbStd=0
echo "Reading text from $infile"
exec 3<> htmlFile.html

line="My foostring"
if [[ $line == *"My"* ]]; then
  echo "It's there2!"
fi

while IFS= read -r line; do
	# reading each line
	#echo "Line No. $n: $line" >&3
	
	if [[ $line == *"<html"* ]]; then
		echo "HTML found"
		echo "$line"  >&3 
	fi
	
	if [[ $line == *"<title"* ]]; then
		echo "title found"
		echo "$line"  >&3 
	fi
	
	if [[ $line == *"<body"* ]]; then
		echo "body found"
		echo "$line"  >&3 
	fi
	
	if [[ $line == *"Number of participants"* ]]; then
		echo "start of table found"
		echo "$line"  >&3 
		echo "<table>" >&3
		insidetable=1
	fi
	
		
	if [ "$insidetable" -gt 0 ]
	then
	
		#If the line starts with ST then echo the line
		if [[ $line == *'<tr class="" id="user-index-participants'* ]]; then
			nbStd=$((nbStd+1))
			echo "student found: $nbStd"		
			echo "$line"  >&3
    	#if [[ $readLine = "<td*" ]] ; then
			#echo "$readLine"
        	#	echo "$readLine" >> $outfile
        	#	read line
        	#	readLine=$line
        	#	if [[ $readLine = "</table>" ]] ; then
            #			echo "$readLine" >> $outfile
        	#	fi
    		#fi
		fi
			
	fi
	
	n=$((n+1))
done < "$infile"

echo "</div></td>"  >&3
echo "</tr>"  >&3
echo "<table>"  >&3
echo "<body>"  >&3
echo "</html>"  >&3


echo "Text read from : $infile & written to: $outfile"

exec 3>&-
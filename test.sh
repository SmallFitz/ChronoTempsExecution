#!/bin/bash

function chrono()
{
	i=0 
	time (
	while (( $i < 1000 )); do
		{   
			eval $1 $i $2 &> /dev/null 
			i=`expr $i + 1`
		}   
	done
	)   
}

cd 1000Dossiers
chrono "find" "-maxdepth 0 -type d -empty | wc -l"


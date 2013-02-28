#!/bin/bash

declare -i nb_fois
nb_fois=0

function chronoEval()
{
	echo "$FUNCNAME ($1 appels)..."
	 
	declare -i i=0 

	time (
	while (( $i < $1 )); do
		{   
			eval $2 &> /dev/null  
			i=`expr $i + 1`
		}   
	done
	)   
}

function chronoFonction()
{
	echo "$FUNCNAME ($1 appels)..."

	declare -i i=0 

	time (
	while (( $i < $1 )); do
		{   
			$2 &> /dev/null
			i=`expr $i + 1`
		}   
	done
	)   
}

function fonction { pwd; }

function comparer 
{ 
	echo "Comparaison en répétant $1 fois chaque commande."
	chronoEval "$1" "pwd"
	chronoFonction "$1" fonction
}

date

comparer 1
comparer 10
comparer 100
comparer 1000
comparer 10000
comparer 100000
comparer 1000000

date

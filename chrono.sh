#!/bin/bash

function testsUnitaires()
{
	echo "Vide find exterieur"
	rm -rf Nouveau
	mkdir -p Nouveau
	if [ `find Nouveau -maxdepth 0 -type d -empty | wc -l` -eq 1 ]
	then
		echo "=> vide"
	else
		echo "ERREUR"; exit
	fi

	echo "Vide find interieur"
	cd Nouveau
	if [ `find . -maxdepth 0 -type d -empty | wc -l` -eq 1 ]
	then
		echo "=> vide"
	else
		echo "ERREUR"; exit
	fi

	echo "Non vide find exterieur"
	cd ..
	touch Nouveau/fic
	if [ `find Nouveau -maxdepth 0 -type d -empty | wc -l` -eq 1 ]
	then
		echo "ERREUR"; exit
	else
		echo "=> pas vide"
	fi

	echo "Non vide find interieur"
	cd Nouveau
	if [ `find . -maxdepth 0 -type d -empty | wc -l` -eq 1 ]
	then
		echo "ERREUR"; exit
	else
		echo "=> pas vide"
	fi

	cd ..
	rm -rf Nouveau

	echo "Non vide rmdir"
	mkdir -p Nouveau
	touch Nouveau/fic
	if ( rmdir Nouveau )
	then
		echo "ERREUR"; exit
	else
		echo "=> pas vide + erreur, c'est NORMAL";
	fi
	
	echo "Vide rmdir"
	if ( rmdir Nouveau )
	then
		echo "=> vide";
	else
		echo "ERREUR"; exit
	fi
}

function creerDossiers()
{
	echo "Creations des 10.000 dossiers..."
	i=0
	while (( $i < 10000 )); do
		{
			mkdir $i
			i=`expr $i + 1`
		}
	done
	echo "Dossiers crees."
}

function chrono()
{
	i=0
	time (
	while (( $i < 1 )); do
		{
			eval $1 $i $2 
			i=`expr $i + 1`
		}
	done
	)
}

function testsTempsExecutions()
{
	# creerDossiers
	if [ ! -e 0 ]
	then
		echo "Erreur : Vous n'avez pas décommenté la ligne # creerDossiers"
		exit
	fi	
}

mkdir -p 10000Dossiers
cd 10000Dossiers

# Tests unitaires
testsUnitaires

# Vide find exterieur
testsTempsExecutions "find" "-maxdepth 0 -type d -empty | wc -l"




#Non vide rmdir
#Non vid
#real    0m54.737s
#user    0m2.596s
#sys     0m5.768s

#Vide find
#=> vide

#real    1m8.142s
#user    0m3.188s
#sys     0m6.636s

#Non vide find
#=> pas vide

#real    1m2.441s
#user    0m3.072s
#sys     0m6.416s


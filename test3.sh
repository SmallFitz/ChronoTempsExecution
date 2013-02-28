#!/bin/bash
 
chronoEval()
{
   echo "$FUNCNAME ($1 appels)..."
   time for ((i=0;i<$1;i++)); do eval $2 &>/dev/null; done
}
 
chronoFonction()
{
   echo "$FUNCNAME ($1 appels)..."
   time for ((i=0;i<$1;i++)); do $2 &>/dev/null; done
}
 
fonction()
{
   pwd 
}
 
comparer()
{
   echo "Comparaison en répétant $1 fois chaque commande."
   chronoEval "$1" "pwd"
   chronoFonction "$1" fonction
}
 
for ((i=1; i<=1000000;i*=10))
do
   comparer $i
done
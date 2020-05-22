#!/bin/bash
#use your own password list to find out md5
#in password list must use line by line
#some words are hard to find it online
#use it here for example:
#password of = M9EmkEi189D2020 = c34055736f065c8fbf14ff43fb02b4ad not found in anywebsite.
#the script will output md5_mysql.sql as well in case of building database
#evaluate ideas
output="md5_mysql.sql"
[ ! -f ./$1 ] && {
	echo """do : $0 passwords(CLEAR).txt""";
	exit 1
}
fl=$(grep -v '^#' $1)
for mdd in $fl; do
	hash="$(echo -n "$mdd" | md5sum)"
	echo "password : $mdd	=> $hash"
	echo "('$mdd', '$hash')," >> $output
done

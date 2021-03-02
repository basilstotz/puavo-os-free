#!/bin/sh

while true;do
    read a
    case $a in
	uhu)
	    echo "--->uhu"
	    ;;
	"")
	    echo "leer"
	    ;;
	*)
	    echo "anders --->$a<----"
    esac
done

	

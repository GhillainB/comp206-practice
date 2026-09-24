#!/bin/bash

read x
if [ $x = "y" ] || [ $x = "Y" ]; then
    echo "YES"
elif [ $x = "n" ] || [ $x = "N" ]; then
    echo "NO"
fi

# --> Have to review when if has double [[ ]] and when we use one []

case $x in
    [yY])
    echo "YES"
    ;;
    [nN])
    echo "NO"
    ;;
esac

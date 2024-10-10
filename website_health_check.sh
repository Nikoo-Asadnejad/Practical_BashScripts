#!/bin/bash

URL="https://example.com"

if curl -s --head --request GET $URL | grep "200 OK" > /dev/null; then 
   echo "$URL is up."
else
   echo "$URL is down!"
fi
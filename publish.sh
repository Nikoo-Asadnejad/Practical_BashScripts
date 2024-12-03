#!/bin/bash

ZIP_FILE="publish.zip"
SERVER_USER="developer"
SERVER_ADDRESS="192.168.1.10"
SERVER_PORT="8090"
REMOTE_PATH="/path/on/server"

zip -r $ZIP_FILE . -x "appsettings.*.json" "web.config"

if [ $? -eq 0 ]; then
  echo "Files successfully zipped as $ZIP_FILE."


  scp $ZIP_FILE $SERVER_USER@$SERVER_ADDRESS:$REMOTE_PATH

  if [ $? -eq 0 ]; then
    echo "File successfully copied to $SERVER_USER@$SERVER_ADDRESS:$REMOTE_PATH."
  else
    echo "Failed to copy the file to the server."
  fi
else
  echo "Failed to create the zip file."
fi

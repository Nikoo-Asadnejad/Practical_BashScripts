#!/bin/bash

ZIP_FILE="publish.zip"
SERVER_USER="your_username"
SERVER_ADDRESS="your_server_address"
REMOTE_PORT=22  
REMOTE_PATH="/path/on/server"


zip -r $ZIP_FILE . -x "appsettings.*.json" "web.config"

if [ $? -eq 0 ]; then
  echo "Files successfully zipped as $ZIP_FILE."

  scp -P $REMOTE_PORT $ZIP_FILE $SERVER_USER@$SERVER_ADDRESS:$REMOTE_PATH

  if [ $? -eq 0 ]; then
    echo "File successfully copied to $SERVER_USER@$SERVER_ADDRESS:$REMOTE_PATH."

    ssh -p $REMOTE_PORT $SERVER_USER@$SERVER_ADDRESS "cd $REMOTE_PATH && unzip -o $ZIP_FILE && echo 'File unzipped successfully on the server.'"

    if [ $? -eq 0 ]; then
      echo "File unzipped successfully on the server."
    else
      echo "Failed to unzip the file on the server."
    fi
  else
    echo "Failed to copy the file to the server."
  fi
else
  echo "Failed to create the zip file."
fi

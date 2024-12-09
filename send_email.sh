#!/bin/bash


usage() {
    echo "Usage: $0 -t <to_email> -s <subject> -b <body_file>"
    echo "  -t: Recipient's email address"
    echo "  -s: Subject of the email"
    echo "  -b: File containing the body of the email"
    exit 1
}


while getopts "t:s:b:" opt; do
    case "$opt" in
        t) TO_EMAIL="$OPTARG" ;;
        s) SUBJECT="$OPTARG" ;;
        b) BODY_FILE="$OPTARG" ;;
        *) usage ;;
    esac
done


if [ -z "$TO_EMAIL" ] || [ -z "$SUBJECT" ] || [ -z "$BODY_FILE" ]; then
    echo "Error: Missing required arguments."
    usage
fi

if [ ! -f "$BODY_FILE" ]; then
    echo "Error: Body file '$BODY_FILE' not found."
    exit 1
fi


cat "$BODY_FILE" | mail -s "$SUBJECT" "$TO_EMAIL"

if [ $? -eq 0 ]; then
    echo "Email sent successfully to $TO_EMAIL"
else
    echo "Failed to send email."
    exit 1
fi

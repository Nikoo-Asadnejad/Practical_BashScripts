#!/bin/bash

usage() {
    echo "Usage: $0 -f <logfile> [-d <date>] [-k <keyword>] [-l <loglevel>] [-o <outputfile>]"
    echo "  -f: Path to the log file"
    echo "  -d: Filter logs by date (e.g., 2024-12-09)"
    echo "  -k: Filter logs by keyword (e.g., 'ERROR')"
    echo "  -l: Filter logs by log level (e.g., 'INFO', 'DEBUG', 'ERROR')"
    echo "  -o: Save filtered logs to output file (optional)"
    exit 1
}

while getopts "f:d:k:l:o:" opt; do
    case "$opt" in
        f) LOGFILE="$OPTARG" ;;
        d) DATE="$OPTARG" ;;
        k) KEYWORD="$OPTARG" ;;
        l) LOGLEVEL="$OPTARG" ;;
        o) OUTPUTFILE="$OPTARG" ;;
        *) usage ;;
    esac
done

# Ensure logfile is provided
if [ -z "$LOGFILE" ]; then
    echo "Error: Log file is required."
    usage
fi

# Check if the log file exists
if [ ! -f "$LOGFILE" ]; then
    echo "Error: Log file '$LOGFILE' not found."
    exit 1
fi

FILTER_CMD="cat $LOGFILE"

if [ -n "$DATE" ]; then
    FILTER_CMD="$FILTER_CMD | grep '$DATE'"
fi


if [ -n "$KEYWORD" ]; then
    FILTER_CMD="$FILTER_CMD | grep '$KEYWORD'"
fi


if [ -n "$LOGLEVEL" ]; then
    FILTER_CMD="$FILTER_CMD | grep '$LOGLEVEL'"
fi


echo "Running filter command: $FILTER_CMD"
FILTERED_LOGS=$(eval "$FILTER_CMD")


if [ -n "$OUTPUTFILE" ]; then
    echo "$FILTERED_LOGS" > "$OUTPUTFILE"
    echo "Filtered logs saved to '$OUTPUTFILE'."
else
    echo "Filtered logs:"
    echo "$FILTERED_LOGS"
fi

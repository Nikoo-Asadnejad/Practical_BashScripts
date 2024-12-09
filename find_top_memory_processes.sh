#!/bin/bash


LIMIT=10


usage() {
    echo "Usage: $0 [-n <number_of_processes>]"
    echo "  -n: Number of top memory-consuming processes to display (default is 10)"
    exit 1
}


while getopts "n:" opt; do
    case "$opt" in
        n) LIMIT="$OPTARG" ;;
        *) usage ;;
    esac
done

echo "Finding the top $LIMIT memory-consuming processes..."

# Fetch and display processes sorted by memory usage
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n "$((LIMIT + 1))"

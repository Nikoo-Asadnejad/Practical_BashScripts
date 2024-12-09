#!/bin/bash


LIMIT=10

usage() {
    echo "Usage: $0 [-n <number_of_processes>]"
    echo "  -n: Number of top CPU-consuming processes to display (default is 10)"
    exit 1
}

while getopts "n:" opt; do
    case "$opt" in
        n) LIMIT="$OPTARG" ;;
        *) usage ;;
    esac
done

echo "Finding the top $LIMIT CPU-consuming processes..."


ps -eo pid,ppid,cmd,%cpu,%mem --sort=-%cpu | head -n "$((LIMIT + 1))"

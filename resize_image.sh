#!/bin/bash

DIR="/path/to/images"
WIDTH=800  

for IMAGE in $DIR/*.{jpg,jpeg,png}; do
    convert "$IMAGE" -resize ${WIDTH} "$IMAGE"
done

echo "All images resized to $WIDTH px width."
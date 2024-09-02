#!/bin/bash

# Determine the file extension
extension="${1##*.}"

# Handle previews based on file type
case "$extension" in
  jpg|jpeg|png|gif)
    # Display image files using w3m
    w3mimgdisplay "$1"
    ;;
  pdf)
    # Convert PDF to image and display
    pdftoppm -png -f 1 -singlefile "$1" /tmp/preview
    w3mimgdisplay /tmp/preview.png
    ;;
  mp4|mkv|webm|avi)
    # Generate a thumbnail from the video and display
    ffmpeg -i "$1" -vf "thumbnail,scale=320:240" -frames:v 1 /tmp/preview.png -y
    w3mimgdisplay /tmp/preview.png
    ;;
  *)
    echo "File type not supported for preview"
    ;;
esac


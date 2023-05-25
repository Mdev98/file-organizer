#!/bin/bash

# Define the target directory to organize
target_directory=$1

# Create directories
find $target_directory/* -type f -print0 | xargs -0 file | cut -d ":" -f 1 | cut -d "." -f 2 | uniq | xargs -I {} mkdir  "$target_directory"/{} 2> /dev/null

# Loop through folders in the target directory
for folder in $target_directory/*; do
  # Check if it's a directory
  if [ -d "$folder" ]; then
    folder_name=$(basename "$folder")

    # Move files matching folder name to the respective folder
    for file in "$target_directory"/*."$folder_name"; do
      if [ -f "$file" ]; then
        mv "$file" "$folder"
      fi
    done
  fi
done

# Create folders for each folder type
mkdir -p "$target_directory/Images"
mkdir -p "$target_directory/Documents"
mkdir -p "$target_directory/Videos"
mkdir -p "$target_directory/Audio"
mkdir -p "$target_directory/Others"

# Loop through files in the target directory
for folder in $target_directory/*; do
  # Check if it's a file (not a directory)
  if [ -d "$folder" ]; then
    # Get the file extension
    folder_name=$(basename "$folder")
    
    # Move the file to the appropriate folder based on its type
    case "$folder_name" in
      jpg|jpeg|png|gif)
        mv "$folder" "$target_directory/Images"
        ;;
      doc|docx|pdf|txt)
        mv "$folder" "$target_directory/Documents"
        ;;
      mp4|avi|mkv|mov)
        mv "$folder" "$target_directory/Videos"
        ;;
      mp3|wav|flac)
        mv "$folder" "$target_directory/Audio"
        ;;
    esac
  fi
done



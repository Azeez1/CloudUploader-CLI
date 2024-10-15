#!/bin/bash

# -------------------------------------------
# CloudUploader CLI Script
# -------------------------------------------
# This script uploads a file to an AWS S3 bucket.
# It checks if the file exists before uploading.
# If successful, the script provides a confirmation message.
# In case of failure, it prints an error message and exits.
# -------------------------------------------

# The first argument ($1) is the file to be uploaded
FILENAME=$1  



# The name of the S3 bucket (replace with your bucket name)
BUCKET_NAME="my-cloud-uploader-bucket-azeez"

# -------------------------------------------
# Step 1: Check if the filename argument is provided
# -------------------------------------------
if [ -z "$FILENAME" ]; then
  # If no filename is provided, print an error and exit
  echo "Error: No file specified. Please provide a file to upload."
  exit 1  # Exit with error code 1 (indicates failure)
fi


# -------------------------------------------
# Step 2: Check if the file exists
# -------------------------------------------
if [ ! -f "$FILENAME" ]; then
  # If the file does not exist, print an error and exit
  echo "Error: File '$FILENAME' does not exist."
  exit 1  # Exit with error code 1 (indicates failure)
fi


# -------------------------------------------
# Step 3: Upload the file to the specified S3 bucket
# -------------------------------------------
# The 'aws s3 cp' command is used to copy the file to the S3 bucket
# Replace 'your-bucket-name' with the actual bucket name
aws s3 cp "$FILENAME" "s3://$BUCKET_NAME/"

# -------------------------------------------
# Step 4: Check if the upload was successful
# -------------------------------------------
# The special variable $? stores the exit status of the last command
# If the upload command was successful, $? will be 0
if [ $? -eq 0 ]; then
  # If the upload succeeded, print a success message
  echo "File uploaded successfully to bucket '$BUCKET_NAME'."
  exit 0  # Exit with success code 0 (indicates success)
else
  # If the upload failed, print an error message
  echo "Error: File upload to bucket '$BUCKET_NAME' failed."
  exit 1  # Exit with error code 1 (indicates failure)
fi

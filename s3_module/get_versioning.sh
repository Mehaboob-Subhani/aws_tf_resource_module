#!/bin/bash

# Get a list of all S3 bucket names
buckets=$(aws s3api list-buckets --query 'Buckets[*].Name' --output text)

# Loop through each bucket and get its versioning configuration
for bucket in $buckets; do
    echo "Bucket: $bucket"
    aws s3api get-bucket-versioning --bucket $bucket
    echo "----------------------------------------"
done

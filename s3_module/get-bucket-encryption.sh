#!/bin/bash

# Get a list of all S3 bucket names
buckets=$(aws s3api list-buckets --query 'Buckets[*].Name' --output text)

# Loop through each bucket and get its encryption configuration
for bucket in $buckets; do
    echo "Bucket: $bucket"
    
    # Get the encryption configuration for the bucket
    encryption_config=$(aws s3api get-bucket-encryption --bucket $bucket 2>/dev/null)

    if [ $? -eq 0 ]; then
        # Encryption is configured for the bucket
        echo "Encryption Configuration:"
        echo $encryption_config | jq .
    else
        # Encryption is not configured for the bucket
        echo "Encryption is not configured for this bucket."
    fi
    
    echo "----------------------------------------"
done

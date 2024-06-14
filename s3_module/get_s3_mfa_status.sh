#!/bin/bash

# Get a list of all S3 bucket names
buckets=$(aws s3api list-buckets --query 'Buckets[*].Name' --output text)

# Loop through each bucket and get its versioning configuration
for bucket in $buckets; do
    echo "Bucket: $bucket"
    versioning_config=$(aws s3api get-bucket-versioning --bucket $bucket)

    # Extract MFA status from the versioning configuration
    mfa_status=$(echo $versioning_config | jq -r '.MFADelete')
    echo "MFA Delete: $mfa_status"
    
    echo "----------------------------------------"
done

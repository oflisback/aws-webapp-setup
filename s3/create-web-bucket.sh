if [ "$#" -lt 1 ]; then
  echo "This script takes one parameter, the s3 bucket name."
  echo "$0 my-unique-bucket-name"
  echo "Note that the bucket name must be globally unique."
  echo "Use aws configure region to see what the currently configured region is"
  exit 1
fi

echo "Using bucket name: $1"

# Create the bucket
aws s3 mb s3://$1

# Configure website
aws s3 website s3://$1/ --index-document index.html --error-document error.html

sed "s/BUCKET/$1/g" ./read-access-policy.json | tee /tmp/read-access-policy.json

# Disable "Block public access"
aws s3api put-public-access-block --bucket $1 --public-access-block-configuration \
  "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=false,RestrictPublicBuckets=false"
# Apply anonymous read access policy
aws s3api put-bucket-policy --bucket $1 --policy file:///tmp/read-access-policy.json

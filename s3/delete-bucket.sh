if [ "$#" -lt 1 ]; then
  echo "This script takes one parameter, the s3 bucket name."
  echo "$0 my-unique-bucket-name"
  echo "Use aws configure region to see what the currently configured region is"
  exit 1
fi

echo "Using bucket name: $1"


aws s3 rb s3://$1 --force

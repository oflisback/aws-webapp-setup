if [ "$#" -lt 2 ]; then
  echo "This script takes two parameters, the s3 bucket name and the dir with the content to upload. E.g.:"
  echo "$0 my-unique-bucket-name ./build"
  echo "The Content-Type for each file is figured out by aws cli."
  exit 1
fi

echo "Using bucket name: $1"
echo "Using folder: $2"

aws s3 sync $2 s3://$1

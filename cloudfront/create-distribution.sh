# This is setup without CNAME / Alias, in this initial version of the
# script this has to be done manually in aws console after creation.

# AFTER this script has executed, do this in aws console, cloudfront:

# Edit distribution, add CNAME (e.g. console.aws.amazon.com (that one is taken tho))
# Select "Custom certificate" then press "Request or Import a Certificate with ACM"
# Enter the hostname in the following dialog, then next.
# Keep the pre-selected DNS Validation
# Do not add tags
# Press Confirm and Request button
# Press continue
# In the summary, expand the domain that is now "Pending validation"
# Press Create route in Route 53 and press confirm button.

# After a while I edited the cloudfront distribution again, had to reenter the CNAME
# and select to use Custom SSL certificate. At this point the previously requested certificate
# was selectable and the cloudfront setup could be completed. :)

if [ "$#" -lt 1 ]; then
  echo "This script takes one parameter, the s3 bucket name / hostname."
  echo "$0 my-unique-bucket-name"
  exit 1
fi

echo "Using bucket/hostname: $1"

sed "s/BUCKET/$1/g" ./distconfig.json | tee /tmp/distconfig.json

aws cloudfront create-distribution --distribution-config file:///tmp/distconfig.json > /tmp/output.txt
cat /tmp/output.txt
cat /tmp/output.txt | grep DomainName

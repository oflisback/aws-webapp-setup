# Scripts and notes for hosting another webapp

Here's a post from someone trying to accomplish pretty much the same thing as me here: [Five minute website hosting with Amazon S3 and CloudFront](https://www.poplatek.fi/en/five-minute-website-hosting-with-amazon-s3-and-cloudfront/).

## Stack

[Route 53](https://aws.amazon.com/route53/) -> [Cloudfront](https://aws.amazon.com/cloudfront/) -> [S3](https://aws.amazon.com/s3/)

## Prerequisites

- [AWS CLI](https://aws.amazon.com/cli/) installed and configured with access credentials and region.
- Domain name registered and directed to [Route 53](https://aws.amazon.com/route53/) hosted zone.

## Instructions

1. Create the s3 bucket using the scripts in [s3](s3/).
2. Create the cloudfront distribution using the scripts in [cloudfront](cloudfront/).
3. Setup the route 53 routing manually using the instructions under [route53](route53/).

#!/usr/bin/env bash
set -x

aws lambda create-function --function-name s3-copy2archive-lambda \
--runtime python2.7 \
--role "arn:aws:iam::661072482170:role/s3_lambda_copy" \
--handler lambda_handler.lambda_handler \
--zip-file fileb://lambda_handler.zip \
--description "Copy a S3 Put object to the Archive Bucket, Glacier" \
--timeout 300 \
--memory-size 1024

set -x

if [ "$?" -ne "0" ]; then
	echo "failed to install lambda function"
	exit 1
fi

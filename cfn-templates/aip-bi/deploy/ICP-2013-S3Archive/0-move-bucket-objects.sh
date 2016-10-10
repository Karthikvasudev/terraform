#!/bin/bash


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ENV=""
REGION=""

while getopts ":e:r:h" opt; do
	case $opt in
		h)
			echo "Usage: $0 -e <env> -r <region e.g. 'us-east-1'>"
			exit 0
			;;

		e)
			ENV=$OPTARG
			;;

		r)
			REGION=$OPTARG
			;;

		:)
			echo "Requires -e <env>, -r <region e.g. 'us-east-1'>"
			exit 1
			;;
	esac
done

if [ -z $ENV ] || [ -z $REGION ]; then
	echo "Usage: $0 -e <env> -r <region e.g. 'us-east-1'>"
	exit 1
fi


S3_Compost="s3://aip-devops-compost-us-east-1-661072482170"


set -x
ret=0



#-------------------------- Bi Buckets ---------------------------#
cd  ${ETL_DIR}

aws s3 mv s3://bi-$ENV-s3-fileupload-us-east-1-661072482170/ ${S3_Compost}/bi-$ENV-fileupload/ --recursive --sse AES256

aws s3 mv s3://bi-$ENV-s3-data-benchmark-us-east-1-661072482170/ ${S3_Compost}/bi-$ENV-benchmark/ --recursive --sse AES256

aws s3 mv s3://bi-$ENV-s3-data-metaanalysis-us-east-1-661072482170/ ${S3_Compost}/bi-$ENV-metaanalysis/ --recursive --sse AES256

aws s3 mv s3://bi-$ENV-s3-dataprocess-fileupload-us-east-1-661072482170/ ${S3_Compost}/bi-$ENV-dataprocess-fileupload/ --recursive --sse AES256


cd ${DIR}
#-----------------------------------------------------------------------------#


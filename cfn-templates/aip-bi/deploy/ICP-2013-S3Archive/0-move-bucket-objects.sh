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


S3_Compost="s3://aip-devops-compost-us-east-1-661072482170/cfn-templates"



set -x
ret=0



#-------------------------- Bi Buckets ---------------------------#
cd  ${ETL_DIR}

[ $? -ne 0 ] || aws s3 cp bi-etl-eb-app.cfn.json ${ETL_33_CFN_LOC}

[ $? -ne 0 ] || aws s3 cp bi-etl-aws-resources.cfn.json ${ETL_33_CFN_LOC}


if [ $? -ne 0 ];then
	ret=$?
	echo "Error: Bucket move Failure $ret"
fi

cd ${DIR}
#-----------------------------------------------------------------------------#


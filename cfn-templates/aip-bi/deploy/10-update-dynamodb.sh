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

set -x

DYNAMODB_DIR="../../platform/dynamodb"

cd ${DYNAMODB_DIR}

aws cloudformation update-stack \
--stack-name aip-platform-resources-$ENV-master \
--template-body file://aip-platform-aws-resources.cfn.json \
--parameters file://aip-platform-resources-$ENV-params-$REGION.json \
--capabilities CAPABILITY_IAM \
--region $REGION


if [ $? -ne 0 ]; then
	ret=$?
	echo "Error: dynamodb update-stack returned $ret"
fi

cd ${DIR}

ret=$?
exit $ret

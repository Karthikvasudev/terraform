#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ENV=""
REGION=""

while getopts ":e:r:h" opt; do
	case $opt in
		h)
			echo "Usage: $0 -e <env> -r <region e.g. 'us-1'>"
			exit 0
			;;

		e)
			ENV=$OPTARG
			;;

		r)
			REGION=$OPTARG
			;;

		:)
			echo "Requires -e <env>, -r <region e.g. 'us-1'>"
			exit 1
			;;

	esac
done

if [ -z $ENV ] || [ -z $REGION ]; then
	echo "Usage: $0 -e <env> -r <region e.g. 'us-1'>"
	exit 1
fi

CF_DIR="../../cloudfront/"


#--------------------------------- Cloudfront -----------------------------------#
cd  ${CF_DIR}


[ $? -ne 0 ] ||aws cloudformation create-stack \
--stack-name aip-cloudfront-$ENV-master \
--template-body file://aip-cloudfront.cfn.json \
--parameters file://aip-cloudfront-$ENV-launch-params-$REGION.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region $REGION

if [ $? -ne 0 ];then
	ret=$?
	echo "Error: Cloudfront update-stack returned $ret"
fi

cd ${DIR}
#-----------------------------------------------------------------------------#

ret=$?

exit $ret
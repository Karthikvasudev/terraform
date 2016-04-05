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


S3_CFN_LOC="s3://aip-devops-us-east-1-661072482170/cfn-templates"

CHRONOS_DIR="../../chronos/"
CHRONOS_33_CFN_LOC="${S3_CFN_LOC}/aip-chronos/"

DATAPIPELINE_DIR="../../datapipeline/"
DATAPIPELINE_33_CFN_LOC="${S3_CFN_LOC}/bi-datapipeline-service/"

ETL_DIR="../../etl/"
ETL_33_CFN_LOC="${S3_CFN_LOC}/bi-etl/"


set -x
ret=0

#--------------------------------- chronos -----------------------------------#
cd  ${CHRONOS_DIR}

[ $? -ne 0 ] || aws s3 cp aip-chronos-aws-resources.cfn.json ${CHRONOS_33_CFN_LOC}
[ $? -ne 0 ] || aws s3 cp aip-chronos-eb-app.cfn.json ${CHRONOS_33_CFN_LOC}

[ $? -ne 0 ] ||aws cloudformation update-stack \
--stack-name aip-chronos-$ENV-master \
--template-body file://aip-chronos-master.cfn.json \
--parameters file://aip-chronos-$ENV-launch-params-$REGION.json \
--capabilities CAPABILITY_IAM \
--region $REGION

if [ $? -ne 0 ];then
	ret=$?
	echo "Error: chronos update-stack returned $ret"
fi

cd ${DIR}
#-----------------------------------------------------------------------------#



#------------------------------- datapipeline --------------------------------#
cd  ${DATAPIPELINE_DIR}

[ $? -ne 0 ] || aws s3 cp bi-datapipeline-service-aws-resources.cfn.json ${DATAPIPELINE_33_CFN_LOC}
[ $? -ne 0 ] || aws s3 cp bi-datapipeline-service-eb-app.cfn.json ${DATAPIPELINE_33_CFN_LOC}

[ $? -ne 0 ] || aws cloudformation update-stack \
--stack-name bi-datapipeline-service-$ENV-master \
--template-body file://bi-datapipeline-service-master.cfn.json \
--parameters file://bi-datapipeline-service-$ENV-launch-params-$REGION.json \
--capabilities CAPABILITY_IAM \
--region $REGION

if [ $? -ne 0 ]; then
	ret=$?
	echo "Error: datapipeline update-stack returned $ret"
fi

cd ${DIR}
#-----------------------------------------------------------------------------#


#---------------------------------- etl --------------------------------------#
cd ${ETL_DIR}

[ $? -ne 0 ] || aws s3 cp bi-etl-aws-resources.cfn.json ${ETL_33_CFN_LOC}
[ $? -ne 0 ] || aws s3 cp bi-etl-eb-app.cfn.json ${ETL_33_CFN_LOC}

[ $? -ne 0 ] || aws cloudformation update-stack \
--stack-name bi-etl-$ENV-master --template-body file://bi-etl-master.cfn.json \
--parameters file://bi-etl-$ENV-launch-params-$REGION.json \
--capabilities CAPABILITY_IAM \
--region $REGION

if [ $? -ne 0 ];then
	ret=$?
	echo "Error: etl update-stack returned $ret"
fi

cd ${DIR}
#-----------------------------------------------------------------------------#


exit $ret

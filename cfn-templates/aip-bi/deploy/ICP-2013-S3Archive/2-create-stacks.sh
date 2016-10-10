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

ETL_DIR="../../etl/"
ETL_33_CFN_LOC="${S3_CFN_LOC}/bi-etl/"

BI_DIR="../../bi-app/"
BI_33_CFN_LOC="${S3_CFN_LOC}/aip-bi/"



set -x
ret=0


#------------------------------ bi App Resources -----------------------------#
cd  ${BI_DIR}

[ $? -ne 0 ] ||aws cloudformation create-stack \
--stack-name bi-app-aws-resources-$ENV-master \
--template-body file://bi-aws-resources.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=$ENV \
ParameterKey=LambdaFunctionName,ParameterValue=s3-copy2archive-lambda \
--capabilities CAPABILITY_IAM --disable-rollback \
--region $REGION

if [ $? -ne 0 ];then
	ret=$?
	echo "Error: BI App Resources update-stack returned $ret"
fi

cd ${DIR}
#-----------------------------------------------------------------------------#



#-------------------------- Bi DataProcess/ETL App ---------------------------#
cd  ${ETL_DIR}

[ $? -ne 0 ] || aws s3 cp bi-etl-eb-app.cfn.json ${ETL_33_CFN_LOC}

[ $? -ne 0 ] || aws s3 cp bi-etl-aws-resources.cfn.json ${ETL_33_CFN_LOC}

[ $? -ne 0 ] ||aws cloudformation create-stack \
--stack-name bi-etl-$ENV-master --template-body file://bi-etl-master.cfn.json \
--parameters file://bi-etl-$ENV-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region $REGION

if [ $? -ne 0 ];then
	ret=$?
	echo "Error: BI App Resources update-stack returned $ret"
fi

cd ${DIR}
#-----------------------------------------------------------------------------#


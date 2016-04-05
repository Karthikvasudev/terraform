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
	echo "Usage: $0 -e <env> -r <region e.g. 'us-1'> -z <zone id>"
	exit 1
fi


S3_CFN_LOC="s3://aip-devops-us-east-1-661072482170/cfn-templates"

PROXY_DIR="../../proxy/"
PROXY_33_CFN_LOC="${S3_CFN_LOC}/aip-proxy/"

BI_DIR="../../bi-app/"
BI_33_CFN_LOC="${S3_CFN_LOC}/aip-bi/"

AIP_DIR="../../platform/"
AIP_33_CFN_LOC="${S3_CFN_LOC}/aip-platform/"

REDIS_DIR="../../redis-cluster/"



set -x
ret=0


#--------------------------------- Proxy -----------------------------------#
cd  ${PROXY_DIR}

[ $? -ne 0 ] || aws s3 cp aip-proxy-eb-app.cfn.json ${PROXY_33_CFN_LOC}

[ $? -ne 0 ] ||aws cloudformation create-stack \
--stack-name aip-proxy-$ENV-master \
--template-body file://aip-proxy-master.cfn.json \
--parameters file://aip-proxy-$ENV-launch-params-$REGION.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region $REGION

if [ $? -ne 0 ];then
	ret=$?
	echo "Error: proxy update-stack returned $ret"
fi

cd ${DIR}
#-----------------------------------------------------------------------------#


#--------------------------------- BI-App -----------------------------------#
cd  ${BI_DIR}

#[ $? -ne 0 ] || aws s3 cp bi-aws-resources.cfn.json ${BI_33_CFN_LOC}
[ $? -ne 0 ] || aws s3 cp bi-eb-app.cfn.json ${BI_33_CFN_LOC}


[ $? -ne 0 ] ||aws cloudformation create-stack \
--stack-name bi-app-$ENV-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-$ENV-launch-params-$REGION.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region $REGION

if [ $? -ne 0 ];then
	ret=$?
	echo "Error: bi-app update-stack returned $ret"
fi

cd ${DIR}
#-----------------------------------------------------------------------------#

#--------------------------------- Platform -----------------------------------#
cd  ${AIP_DIR}

[ $? -ne 0 ] || aws s3 cp aip-platform-eb-app.cfn.json ${AIP_33_CFN_LOC}

[ $? -ne 0 ] ||aws cloudformation create-stack \
--stack-name aip-platform-$ENV-master \
--template-body file://aip-platform-master.cfn.json \
--parameters file://aip-platform-$ENV-launch-params-$REGION.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region $REGION

if [ $? -ne 0 ];then
	ret=$?
	echo "Error: platform update-stack returned $ret"
fi

cd ${DIR}
#-----------------------------------------------------------------------------#


#--------------------------------- Redis -----------------------------------#
cd  ${REDIS_DIR}


[ $? -ne 0 ] ||aws cloudformation create-stack \
--stack-name aip-redis-$ENV-master \
--template-body file://aip-redis-cluster.cfn.json \
--parameters file://aip-redis-cluster-$ENV-launch-params-$REGION.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region $REGION

if [ $? -ne 0 ];then
	ret=$?
	echo "Error: redis update-stack returned $ret"
fi

cd ${DIR}
#-----------------------------------------------------------------------------#


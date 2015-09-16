#!/usr/bin/env bash

# run AWS CloudFormation Stack to create/update the BI application

aws cloudformation create-stack --stack-name aip-bi-app \
--template-body file://aip-bi-master.cfn.json \
--parameters file://aip-bi-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--profile test



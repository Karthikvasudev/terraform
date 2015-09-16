#!/usr/bin/env bash

# run AWS CloudFormation Stack to create/update the BI Administration VPC
aws cloudformation create-stack \
--stack-name aip-bi-admin-vpc \
--template-body file://aip-bi-admin-vpc.cfn.json \
--parameters file://aip-bi-admin-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback --profile test



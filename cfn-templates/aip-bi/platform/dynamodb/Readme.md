#Readme.md

run AWS CloudFormation Stack commands for BI Environments
Copy/Paste into bash shell window

# Platform Services Resources (DynamoDB, SNS, S3, SQS, etc.)

## DevOps 
aws cloudformation create-stack \
--stack-name aip-platform-resources-devops-master \
--template-body file://aip-platform-aws-resources.cfn.json \
--parameters file://aip-platform-resources-devops-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

aws cloudformation update-stack \
--stack-name aip-platform-resources-devops-master \
--template-body file://aip-platform-aws-resources.cfn.json \
--parameters file://aip-platform-resources-devops-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1

## Dev
aws cloudformation create-stack \
--stack-name aip-platform-resources-dev-master \
--template-body file://aip-platform-aws-resources.cfn.json \
--parameters file://aip-platform-resources-dev-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

aws cloudformation update-stack \
--stack-name aip-platform-resources-dev-master \
--template-body file://aip-platform-aws-resources.cfn.json \
--parameters file://aip-platform-resources-dev-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1


## Test
aws cloudformation create-stack \
--stack-name aip-platform-resources-test-master \
--template-body file://aip-platform-aws-resources.cfn.json \
--parameters file://aip-platform-resources-test-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

aws cloudformation update-stack \
--stack-name aip-platform-resources-test-master \
--template-body file://aip-platform-aws-resources.cfn.json \
--parameters file://aip-platform-resources-test-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1



## QA
aws cloudformation create-stack \
--stack-name aip-platform-resources-qa-master \
--template-body file://aip-platform-aws-resources.cfn.json \
--parameters file://aip-platform-resources-qa-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

aws cloudformation update-stack \
--stack-name aip-platform-resources-qa-master \
--template-body file://aip-platform-aws-resources.cfn.json \
--parameters file://aip-platform-resources-qa-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1


## Prod
aws cloudformation create-stack \
--stack-name aip-platform-resources-prod-master \
--template-body file://aip-platform-aws-resources.cfn.json \
--parameters file://aip-platform-resources-prod-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

aws cloudformation update-stack \
--stack-name aip-platform-resources-prod-master \
--template-body file://aip-platform-aws-resources.cfn.json \
--parameters file://aip-platform-resources-prod-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1

## Prod2
aws cloudformation create-stack \
--stack-name aip-platform-resources-prod2-master \
--template-body file://aip-platform-aws-resources.cfn.json \
--parameters file://aip-platform-resources-prod2-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

aws cloudformation update-stack \
--stack-name aip-platform-resources-prod2-master \
--template-body file://aip-platform-aws-resources.cfn.json \
--parameters file://aip-platform-resources-prod2-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1



########################################
# ------ Ireland EU-west-1 Region ------
########################################

# Prod

## DynamoDB resource
aws cloudformation create-stack \
--stack-name aip-platform-resources-prod-master \
--template-body file://aip-platform-aws-resources.cfn.json \
--parameters file://aip-platform-resources-prod-params-eu-west-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region eu-west-1

aws cloudformation update-stack \
--stack-name aip-platform-resources-prod-master \
--template-body file://aip-platform-aws-resources.cfn.json \
--parameters file://aip-platform-resources-prod-params-eu-west-1.json \
--capabilities CAPABILITY_IAM \
--region eu-west-1



########################################
# ------- Tokyo EU-west-1 Region -------
########################################

# Prod

## DynamoDB resource
aws cloudformation create-stack \
--stack-name aip-platform-resources-prod-master \
--template-body file://aip-platform-aws-resources.cfn.json \
--parameters file://aip-platform-resources-prod-params-ap-northeast-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region ap-northeast-1

## DynamoDB resource
aws cloudformation update-stack \
--stack-name aip-platform-resources-prod-master \
--template-body file://aip-platform-aws-resources.cfn.json \
--parameters file://aip-platform-resources-prod-params-ap-northeast-1.json \
--capabilities CAPABILITY_IAM \
--region ap-northeast-1

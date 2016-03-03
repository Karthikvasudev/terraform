#Readme.md

run AWS CloudFormation Stack commands for BI Environments
Copy/Paste into bash shell window
Note: include --profile sandbox when testing only. Included for safety reasons




# Abbott AWS -- Beanstalk App -- Platform Services "aip-us-east-1"


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









########################################
# ------ Ireland EU-west-1 Region ------
########################################


# Prod

## DynamoDB resource
aws cloudformation create-stack \
--stack-name aip-platform-resources-prod-master \
--template-body file://aip-platform-aws-resources.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=prod \
--capabilities CAPABILITY_IAM --disable-rollback \
--region eu-west-1



########################################
# ------- Tokyo EU-west-1 Region -------
########################################


# Prod

## DynamoDB resource
aws cloudformation create-stack \
--stack-name aip-platform-resources-prod-master \
--template-body file://aip-platform-aws-resources.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=prod \
--capabilities CAPABILITY_IAM --disable-rollback \
--region ap-northeast-1



#Readme.md

run AWS CloudFormation Stack commands for BI Environments
Copy/Paste into bash shell window
Note: include --profile sandbox when testing only. Included for safety reasons




### Abbott AWS -- Beanstalk App -- Platform Services "aip-us-east-1"
##
### Dev
## -- Create Abbott AWS: Dev environment --
aws cloudformation create-stack \
--stack-name aip-platform-dev-master2 \
--template-body file://aip-platform-master.cfn.json \
--parameters file://aip-platform-dev-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update Abbott AWS: Dev environment --
aws cloudformation update-stack \
--stack-name aip-platform-dev-master2 \
--template-body file://aip-platform-master.cfn.json \
--parameters file://aip-platform-dev-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1


### DynamoDB resource
aws cloudformation create-stack \
--stack-name aip-platform-resources-dev-master \
--template-body file://aip-platform-aws-resources.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=dev \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1




## -- Create Abbott AWS: Test environment --
aws cloudformation create-stack \
--stack-name aip-platform-test-master \
--template-body file://aip-platform-master.cfn.json \
--parameters file://aip-platform-test-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1


## -- update Abbott AWS: Test environment --
aws cloudformation update-stack \
--stack-name aip-platform-test-master \
--template-body file://aip-platform-master.cfn.json \
--parameters file://aip-platform-test-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1


### DynamoDB resource
aws cloudformation create-stack \
--stack-name aip-platform-resources-test-master \
--template-body file://aip-platform-aws-resources.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=test \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1




## -- Create Abbott AWS: QA environment --
aws cloudformation create-stack \
--stack-name aip-platform-qa-master \
--template-body file://aip-platform-master.cfn.json \
--parameters file://aip-platform-qa-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1


## -- update Abbott AWS: QA environment --
aws cloudformation update-stack \
--stack-name aip-platform-qa-master \
--template-body file://aip-platform-master.cfn.json \
--parameters file://aip-platform-qa-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1


### DynamoDB resource
aws cloudformation create-stack \
--stack-name aip-platform-resources-qa-master \
--template-body file://aip-platform-aws-resources.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=qa \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1



## -- Create Abbott AWS: Prod environment --
aws cloudformation create-stack \
--stack-name aip-platform-prod-master \
--template-body file://aip-platform-master.cfn.json \
--parameters file://aip-platform-prod-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1


## -- update Abbott AWS: Prod environment --
aws cloudformation update-stack \
--stack-name aip-platform-prod-master \
--template-body file://aip-platform-master.cfn.json \
--parameters file://aip-platform-prod-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1


### DynamoDB resource
aws cloudformation create-stack \
--stack-name aip-platform-resources-prod-master \
--template-body file://aip-platform-aws-resources.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=prod \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1



## -- Create Abbott AWS: prod2 environment --
aws cloudformation create-stack \
--stack-name aip-platform-prod2-master \
--template-body file://aip-platform-master.cfn.json \
--parameters file://aip-platform-prod2-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1


## -- update Abbott AWS: prod2 environment --
aws cloudformation update-stack \
--stack-name aip-platform-prod2-master \
--template-body file://aip-platform-master.cfn.json \
--parameters file://aip-platform-prod2-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1


### DynamoDB resource
aws cloudformation create-stack \
--stack-name aip-platform-resources-prod2-master \
--template-body file://aip-platform-aws-resources.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=prod2 \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1





## -- Create Abbott AWS: Beta environment --
aws cloudformation create-stack \
--stack-name aip-platform-beta-master \
--template-body file://aip-platform-master.cfn.json \
--parameters file://aip-platform-beta-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1


## -- update Abbott AWS: Beta environment --
aws cloudformation update-stack \
--stack-name aip-platform-beta-master \
--template-body file://aip-platform-master.cfn.json \
--parameters file://aip-platform-beta-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1


### DynamoDB resource
aws cloudformation create-stack \
--stack-name aip-platform-resources-beta-master \
--template-body file://aip-platform-aws-resources.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=beta \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1




## -- Create Abbott AWS: DevOps environment --
aws cloudformation create-stack \
--stack-name aip-platform-devops-master \
--template-body file://aip-platform-master.cfn.json \
--parameters file://aip-platform-devops-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1


## -- update Abbott AWS: Devops environment --
aws cloudformation update-stack \
--stack-name aip-platform-devops-master \
--template-body file://aip-platform-master.cfn.json \
--parameters file://aip-platform-devops-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1


### DynamoDB resource
aws cloudformation create-stack \
--stack-name aip-platform-resources-devops-master \
--template-body file://aip-platform-aws-resources.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=devops \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1



########################################
# ------ Ireland EU-west-1 Region ------
########################################


# Prod

## -- Create Abbott AWS: Prod environment --
aws cloudformation create-stack \
--stack-name aip-platform-prod-master \
--template-body file://aip-platform-master.cfn.json \
--parameters file://aip-platform-prod-launch-params-eu-west-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region eu-west-1

## -- update Abbott AWS: Prod environment --
aws cloudformation update-stack \
--stack-name aip-platform-prod-master \
--template-body file://aip-platform-master.cfn.json \
--parameters file://aip-platform-prod-launch-params-eu-west-1.json \
--capabilities CAPABILITY_IAM \
--region eu-west-1


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

## -- Create Abbott AWS: Prod environment --
aws cloudformation create-stack \
--stack-name aip-platform-prod-master \
--template-body file://aip-platform-master.cfn.json \
--parameters file://aip-platform-prod-launch-params-ap-northeast-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region ap-northeast-1

## -- update Abbott AWS: Prod environment --
aws cloudformation update-stack \
--stack-name aip-platform-prod-master \
--template-body file://aip-platform-master.cfn.json \
--parameters file://aip-platform-prod-launch-params-ap-northeast-1.json \
--capabilities CAPABILITY_IAM \
--region ap-northeast-1


## DynamoDB resource
aws cloudformation create-stack \
--stack-name aip-platform-resources-prod-master \
--template-body file://aip-platform-aws-resources.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=prod \
--capabilities CAPABILITY_IAM --disable-rollback \
--region ap-northeast-1



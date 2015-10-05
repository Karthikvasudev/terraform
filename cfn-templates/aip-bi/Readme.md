#Readme.md

run AWS CloudFormation Stack commands for BI Environments
Copy/Paste into bash shell window
Note: include --profile test when testing only. Included for safety reasons


### BI Administration VPC -- 
aws cloudformation create-stack \
--stack-name aip-bi-admin-vpc \
--template-body file://aip-bi-admin-vpc.cfn.json \
--parameters file://aip-bi-admin-vpc-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback --profile test

aws cloudformation update-stack \
--stack-name aip-bi-admin-vpc \
--template-body file://aip-bi-admin-vpc.cfn.json \
--parameters file://aip-bi-admin-vpc-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --profile test

###VPN connection for BI Administration VPC
aws cloudformation update-stack \
--stack-name aip-bi-admin-vpc-vpn \
--template-body file://aip-bi-admin-vpc-vpn.cfn.json \
--parameters file://aip-bi-admin-vpc-vpn-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback --profile test




### BI VPC Environments -- 
##
## -- Dev --
aws cloudformation create-stack \
--stack-name aip-bi-dev-vpc \
--template-body file://aip-bi-vpc.cfn.json \
--parameters file://aip-bi-dev-vpc-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback --profile test

##
## -- Test --
### BI VPC Environments -- Use update-stack once create-stack succeeds
aws cloudformation create-stack \
--stack-name aip-bi-test-vpc \
--template-body file://aip-bi-vpc.cfn.json \
--parameters file://aip-bi-test-vpc-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback --profile test

##
## -- QA --
### BI VPC Environments -- Use update-stack once create-stack succeeds
aws cloudformation create-stack \
--stack-name aip-bi-qa-vpc \
--template-body file://aip-bi-vpc.cfn.json \
--parameters file://aip-bi-qa-vpc-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback --profile test

##
## -- Prod --
### BI VPC Environments -- Use update-stack once create-stack succeeds
aws cloudformation create-stack \
--stack-name aip-bi-prod-vpc \
--template-body file://aip-bi-vpc.cfn.json \
--parameters file://aip-bi-prod-vpc-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback --profile test



# DEBUG - Validate Template
aws cloudformation validate-template \
--template-body file://aip-bi-master-test.cfn.json \
--cli-input-json file://aip-bi-dev-master-launch-params-us-east-1-test.json --profile test



##
## -- VPC peering --
### 

##
## -- VPN --
### 



### BI Beanstalk deployment via Master Template -- 
##
## -- Test Dev --
aws cloudformation create-stack \
--stack-name aip-bi-dev-master \
--template-body file://aip-bi-master-test.cfn.json \
--parameters file://aip-bi-dev-master-launch-params-us-east-1-test.json \
--capabilities CAPABILITY_IAM --disable-rollback --profile test

## -- Abbott Dev --
aws cloudformation create-stack \
--stack-name aip-bi-dev-master \
--template-body file://aip-bi-master.cfn.json \
--parameters file://aip-bi-dev-master-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback --profile test

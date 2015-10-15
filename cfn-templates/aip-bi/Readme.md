#Readme.md

run AWS CloudFormation Stack commands for BI Environments
Copy/Paste into bash shell window
Note: include --profile sandbox when testing only. Included for safety reasons
Note: The Dev VPC must be created before the 'test, qa, or prod' environments. It establishes the BI Application, while the others attach 'Environments' to the BI Application.


### BI Administration VPC -- 
aws cloudformation create-stack \
--stack-name aip-bi-admin-vpc \
--template-body file://aip-bi-admin-vpc.cfn.json \
--parameters file://aip-bi-admin-vpc-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback --profile sandbox

aws cloudformation update-stack \
--stack-name aip-bi-admin-vpc \
--template-body file://aip-bi-admin-vpc.cfn.json \
--parameters file://aip-bi-admin-vpc-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --profile sandbox

###VPN connection for BI Administration VPC
aws cloudformation update-stack \
--stack-name aip-bi-admin-vpc-vpn \
--template-body file://aip-bi-admin-vpc-vpn.cfn.json \
--parameters file://aip-bi-admin-vpc-vpn-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback --profile sandbox




### BI VPC Environments -- 
##
## -- Dev --
aws cloudformation create-stack \
--stack-name aip-bi-dev-vpc \
--template-body file://aip-bi-vpc.cfn.json \
--parameters file://aip-bi-dev-vpc-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback 

##
## -- Test --
### BI VPC Environments -- Use update-stack once create-stack succeeds
aws cloudformation create-stack \
--stack-name aip-bi-test-vpc \
--template-body file://aip-bi-vpc.cfn.json \
--parameters file://aip-bi-test-vpc-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback 

##
## -- QA --
### BI VPC Environments -- Use update-stack once create-stack succeeds
aws cloudformation create-stack \
--stack-name aip-bi-qa-vpc \
--template-body file://aip-bi-vpc.cfn.json \
--parameters file://aip-bi-qa-vpc-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback 

##
## -- Prod --
### BI VPC Environments -- Use update-stack once create-stack succeeds
aws cloudformation create-stack \
--stack-name aip-bi-prod-vpc \
--template-body file://aip-bi-vpc.cfn.json \
--parameters file://aip-bi-prod-vpc-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback 



# DEBUG - Validate Template
aws cloudformation validate-template \
--template-body file://aip-bi-master-test.cfn.json \
--cli-input-json file://aip-bi-dev-master-launch-params-us-east-1-test.json --profile sandbox



##
## -- VPN --
### 



### Sandbox -- BI Beanstalk deployment via Master Template -- 
##
## -- Create Sandbox AWS: Dev environment --
aws cloudformation create-stack \
--stack-name aip-bi-dev-master \
--template-body file://aip-bi-master.cfn.json \
--parameters file://aip-bi-dev-master-launch-params-us-east-1-sandbox.json \
--capabilities CAPABILITY_IAM --disable-rollback --profile sandbox

##
## -- Update Sandbox AWS: Dev environment --
aws cloudformation update-stack \
--stack-name aip-bi-dev-master \
--template-body file://aip-bi-master.cfn.json \
--parameters file://aip-bi-dev-master-launch-params-us-east-1-sandbox.json \
--capabilities CAPABILITY_IAM  --profile sandbox


## -- Create Sandbox AWS: Test environment --
aws cloudformation create-stack \
--stack-name aip-bi-test-master \
--template-body file://aip-bi-master.cfn.json \
--parameters file://aip-bi-test-master-launch-params-us-east-1-sandbox.json \
--capabilities CAPABILITY_IAM --disable-rollback --profile sandbox

## -- Update Sandbox AWS: Test environment --
aws cloudformation update-stack \
--stack-name aip-bi-test-master \
--template-body file://aip-bi-master.cfn.json \
--parameters file://aip-bi-test-master-launch-params-us-east-1-sandbox.json \
--capabilities CAPABILITY_IAM --profile sandbox

#### --------------------------



### Abbott AWS -- BI Beanstalk deployment via Master Template -- 
##
### Dev
## -- Create Abbott AWS: Dev environment --
aws cloudformation create-stack \
--stack-name aip-bi-dev-master \
--template-body file://aip-bi-master.cfn.json \
--parameters file://aip-bi-dev-master-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback 

## -- Update Abbott AWS: Dev environment --
aws cloudformation update-stack \
--stack-name aip-bi-dev-master \
--template-body file://aip-bi-master.cfn.json \
--parameters file://aip-bi-dev-master-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM

### Test
## -- Create Abbott AWS: Test environment --
aws cloudformation create-stack \
--stack-name aip-bi-test-master \
--template-body file://aip-bi-master.cfn.json \
--parameters file://aip-bi-test-master-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback 

## -- Update Abbott AWS: Test environment --
aws cloudformation update-stack \
--stack-name aip-bi-test-master \
--template-body file://aip-bi-master.cfn.json \
--parameters file://aip-bi-test-master-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM





## DynamoDB
aws cloudformation create-stack \
--stack-name aip-application-service \
--template-body file://aip-application-service.cfn.json \
--cli-input-json file://aip-dev-application-service-launch-params.json \
--capabilities CAPABILITY_IAM --disable-rollback


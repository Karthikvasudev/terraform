#Readme.md

run AWS CloudFormation Stack commands for BI Environments
Copy/Paste into bash shell window
Note: include --profile sandbox when testing only. Included for safety reasons
Note: The Dev VPC must be created before the 'test, qa, or prod' environments. It establishes the BI Application, while the others attach 'Environments' to the BI Application.


### Administration VPC -- 
aws cloudformation create-stack \
--stack-name aip-admin-vpc \
--template-body file://aip-vpc-admin.cfn.json \
--parameters file://aip-vpc-admin-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback --profile sandbox

aws cloudformation update-stack \
--stack-name aip-admin-vpc \
--template-body file://aip-vpc-admin.cfn.json \
--parameters file://aip-vpc-admin-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --profile sandbox

###VPN connection for BI Administration VPC
aws cloudformation update-stack \
--stack-name aip-admin-vpc-vpn \
--template-body file://aip-vpc-admin-vpn.cfn.json \
--parameters file://aip-vpc-admin-vpn-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback --profile sandbox


#### --------------------------

### Sandbox -- VPC Environments -- Sandbox
##
## -- Dev --
aws cloudformation create-stack \
--stack-name aip-dev-vpc \
--template-body file://aip-vpc.cfn.json \
--parameters file://aip-vpc-dev-launch-params-us-east-1-sandbox.json \
--capabilities CAPABILITY_IAM --disable-rollback --profile sandbox

##
## -- Test --
### BI VPC Environments -- Use update-stack once create-stack succeeds
aws cloudformation create-stack \
--stack-name aip-test-vpc \
--template-body file://aip-vpc.cfn.json \
--parameters file://aip-vpc-test-launch-params-us-east-1-sandbox.json \
--capabilities CAPABILITY_IAM --disable-rollback --profile sandbox

##
## -- QA --
### BI VPC Environments -- Use update-stack once create-stack succeeds
aws cloudformation create-stack \
--stack-name aip-qa-vpc \
--template-body file://aip-vpc.cfn.json \
--parameters file://aip-vpc-qa-launch-params-us-east-1-sandbox.json \
--capabilities CAPABILITY_IAM --disable-rollback --profile sandbox

##
## -- Prod --
### BI VPC Environments -- Use update-stack once create-stack succeeds
aws cloudformation create-stack \
--stack-name aip-prod-vpc \
--template-body file://aip-vpc.cfn.json \
--parameters file://aip-vpc-prod-launch-params-us-east-1-sandbox.json \
--capabilities CAPABILITY_IAM --disable-rollback --profile sandbox


#### --------------------------

NOTE: R53 must be updated with any new VPC creations. Be sure to make the associations and drop any old ones. 

### Abbott AWS -- VPC Environments -- 
##
## -- Dev --
aws cloudformation create-stack \
--stack-name aip-dev-vpc \
--template-body file://aip-vpc.cfn.json \
--parameters file://aip-vpc-dev-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback 

# -- Dev -- Update Stack
aws cloudformation update-stack \
--stack-name aip-dev-vpc \
--template-body file://aip-vpc.cfn.json \
--parameters file://aip-vpc-dev-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM 


##
## -- Test --
### BI VPC Environments -- Use update-stack once create-stack succeeds
aws cloudformation create-stack \
--stack-name aip-test-vpc \
--template-body file://aip-vpc.cfn.json \
--parameters file://aip-vpc-test-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback 

##
## -- QA --
### BI VPC Environments -- Use update-stack once create-stack succeeds
aws cloudformation create-stack \
--stack-name aip-qa-vpc \
--template-body file://aip-vpc.cfn.json \
--parameters file://aip-vpc-qa-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback 

## Update Stack
aws cloudformation update-stack \
--stack-name aip-qa-vpc \
--template-body file://aip-vpc.cfn.json \
--parameters file://aip-vpc-qa-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM 



##
## -- Prod --
### BI VPC Environments -- Use update-stack once create-stack succeeds
aws cloudformation create-stack \
--stack-name aip-prod-vpc \
--template-body file://aip-vpc.cfn.json \
--parameters file://aip-vpc-prod-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback 

## Update Stack
aws cloudformation update-stack \
--stack-name aip-prod-vpc \
--template-body file://aip-vpc.cfn.json \
--parameters file://aip-vpc-prod-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM 


##
## -- Beta --
### BI VPC Environments -- Use update-stack once create-stack succeeds
aws cloudformation create-stack \
--stack-name aip-beta-vpc \
--template-body file://aip-vpc.cfn.json \
--parameters file://aip-vpc-beta-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback 

## Update Stack
aws cloudformation update-stack \
--stack-name aip-beta-vpc \
--template-body file://aip-vpc.cfn.json \
--parameters file://aip-vpc-beta-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM 

##
## -- DevOps --
### BI VPC Environments --Create-stack 
aws cloudformation create-stack \
--stack-name aip-devops-vpc \
--template-body file://aip-vpc.cfn.json \
--parameters file://aip-vpc-devops-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback 

### BI VPC Environments -- Update-stack
aws cloudformation update-stack \
--stack-name aip-devops-vpc \
--template-body file://aip-vpc.cfn.json \
--parameters file://aip-vpc-devops-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM  









#### --------------------------



### Abbott AWS -- DNS Route 53 -- 
##
### Dev
## -- Create Abbott AWS: Dev environment --


## -- Update Abbott AWS: Dev environment --



## -- Create Sandbox AWS: Dev environment --
aws cloudformation create-stack \
--stack-name aip-dns-private \
--template-body file://aip-dns-private.cfn.json \
--capabilities CAPABILITY_IAM --disable-rollback --profile sandbox

## -- Create Sandbox AWS: Dev environment --
aws cloudformation create-stack \
--stack-name aip-dns-public \
--template-body file://aip-dns-public.cfn.json \
--capabilities CAPABILITY_IAM --disable-rollback --profile sandbox
#### --------------------------




Testing / Debugging
## -- Create Abbott AWS: Prod environment --
aws cloudformation create-stack \
--stack-name aip-roles-master \
--template-body file://aip-eb-roles.cfn.json \
--capabilities CAPABILITY_IAM --disable-rollback


#Readme.md

run AWS CloudFormation Stack commands for BI Environments
Copy/Paste into bash shell window
Note: include --profile sandbox when testing only.

# ------ US-East-1 Region ------

### Administration VPC -- 
aws cloudformation create-stack \
--stack-name aip-admin-vpc \
--template-body file://aip-vpc-admin.cfn.json \
--parameters file://aip-vpc-admin-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback --profile sandbox --region us-east-1

aws cloudformation update-stack \
--stack-name aip-admin-vpc \
--template-body file://aip-vpc-admin.cfn.json \
--parameters file://aip-vpc-admin-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --profile sandbox --region us-east-1

### VPN connection for BI Administration VPC
aws cloudformation update-stack \
--stack-name aip-admin-vpc-vpn \
--template-body file://aip-vpc-admin-vpn.cfn.json \
--parameters file://aip-vpc-admin-vpn-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback --profile sandbox --region us-east-1


#### --------------------------

### Sandbox -- VPC Environments -- Sandbox
##
## -- Dev --
aws cloudformation create-stack \
--stack-name aip-dev-vpc \
--template-body file://aip-vpc.cfn.json \
--parameters file://aip-vpc-dev-launch-params-us-east-1-sandbox.json \
--capabilities CAPABILITY_IAM --disable-rollback --profile sandbox --region us-east-1

##
## -- Test --
### BI VPC Environments -- Use update-stack once create-stack succeeds
aws cloudformation create-stack \
--stack-name aip-test-vpc \
--template-body file://aip-vpc.cfn.json \
--parameters file://aip-vpc-test-launch-params-us-east-1-sandbox.json \
--capabilities CAPABILITY_IAM --disable-rollback --profile sandbox --region us-east-1

##
## -- QA --
### BI VPC Environments -- Use update-stack once create-stack succeeds
aws cloudformation create-stack \
--stack-name aip-qa-vpc \
--template-body file://aip-vpc.cfn.json \
--parameters file://aip-vpc-qa-launch-params-us-east-1-sandbox.json \
--capabilities CAPABILITY_IAM --disable-rollback --profile sandbox --region us-east-1

##
## -- Prod --
### BI VPC Environments -- Use update-stack once create-stack succeeds
aws cloudformation create-stack \
--stack-name aip-prod-vpc \
--template-body file://aip-vpc.cfn.json \
--parameters file://aip-vpc-prod-launch-params-us-east-1-sandbox.json \
--capabilities CAPABILITY_IAM --disable-rollback --profile sandbox --region us-east-1


#### --------------------------

NOTE: R53 must be updated with any new VPC creations. Be sure to make the associations and drop any old ones. 

### Abbott AWS -- VPC Environments -- 
##
## -- Dev --
aws cloudformation create-stack \
--stack-name aip-dev-vpc \
--template-body file://aip-vpc.cfn.json \
--parameters file://aip-vpc-dev-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback --region us-east-1

# -- Dev -- Update Stack
aws cloudformation update-stack \
--stack-name aip-dev-vpc \
--template-body file://aip-vpc.cfn.json \
--parameters file://aip-vpc-dev-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --region us-east-1 


##
## -- Test --
### BI VPC Environments -- Use update-stack once create-stack succeeds
aws cloudformation create-stack \
--stack-name aip-test-vpc \
--template-body file://aip-vpc.cfn.json \
--parameters file://aip-vpc-test-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback --region us-east-1

##
## -- QA --
### BI VPC Environments -- Use update-stack once create-stack succeeds
aws cloudformation create-stack \
--stack-name aip-qa-vpc \
--template-body file://aip-vpc.cfn.json \
--parameters file://aip-vpc-qa-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback --region us-east-1

## Update Stack
aws cloudformation update-stack \
--stack-name aip-qa-vpc \
--template-body file://aip-vpc.cfn.json \
--parameters file://aip-vpc-qa-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --region us-east-1 



##
## -- Prod --
### BI VPC Environments -- Use update-stack once create-stack succeeds
aws cloudformation create-stack \
--stack-name aip-prod-vpc \
--template-body file://aip-vpc.cfn.json \
--parameters file://aip-vpc-prod-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback --region us-east-1

## Update Stack
aws cloudformation update-stack \
--stack-name aip-prod-vpc \
--template-body file://aip-vpc.cfn.json \
--parameters file://aip-vpc-prod-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --region us-east-1 


##
## -- Prod2 --
### BI VPC Environments -- Use update-stack once create-stack succeeds
aws cloudformation create-stack \
--stack-name aip-prod2-vpc \
--template-body file://aip-vpc.cfn.json \
--parameters file://aip-vpc-prod2-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback --region us-east-1

## Update Stack
aws cloudformation update-stack \
--stack-name aip-prod2-vpc \
--template-body file://aip-vpc.cfn.json \
--parameters file://aip-vpc-prod2-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --region us-east-1 


##
## -- Beta --
### BI VPC Environments -- Use update-stack once create-stack succeeds
aws cloudformation create-stack \
--stack-name aip-beta-vpc \
--template-body file://aip-vpc.cfn.json \
--parameters file://aip-vpc-beta-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback --region us-east-1

## Update Stack
aws cloudformation update-stack \
--stack-name aip-beta-vpc \
--template-body file://aip-vpc.cfn.json \
--parameters file://aip-vpc-beta-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --region us-east-1 

##
## -- DevOps --
### BI VPC Environments --Create-stack 
aws cloudformation create-stack \
--stack-name aip-devops-vpc \
--template-body file://aip-vpc.cfn.json \
--parameters file://aip-vpc-devops-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback --region us-east-1

### BI VPC Environments -- Update-stack
aws cloudformation update-stack \
--stack-name aip-devops-vpc \
--template-body file://aip-vpc.cfn.json \
--parameters file://aip-vpc-devops-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --region us-east-1  



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
--capabilities CAPABILITY_IAM --disable-rollback --region us-east-1 --profile sandbox

## -- Create Sandbox AWS: Dev environment --
aws cloudformation create-stack \
--stack-name aip-dns-public \
--template-body file://aip-dns-public.cfn.json \
--capabilities CAPABILITY_IAM --disable-rollback --region us-east-1 --profile sandbox
#### --------------------------



Testing / Debugging
## -- Create Abbott AWS: Prod environment --
aws cloudformation create-stack \
--stack-name aip-roles-master \
--template-body file://aip-eb-roles.cfn.json \
--capabilities CAPABILITY_IAM --disable-rollback --region us-east-1 














#############################################
# ------ Frankfurt EU-Central-1 Region ------
#############################################


aws cloudformation create-stack \
--stack-name aip-admin-vpc \
--template-body file://aip-vpc-admin.cfn.json \
--parameters file://aip-vpc-admin-launch-params-eu-central-1.json \
--capabilities CAPABILITY_IAM --disable-rollback --region eu-central-1

aws cloudformation update-stack \
--stack-name aip-admin-vpc \
--template-body file://aip-vpc-admin.cfn.json \
--parameters file://aip-vpc-admin-launch-params-eu-central-1.json \
--capabilities CAPABILITY_IAM --region eu-central-1


##
## -- QA --
### BI VPC Environments -- Use update-stack once create-stack succeeds
aws cloudformation create-stack \
--stack-name aip-qa-vpc \
--template-body file://aip-vpc.cfn.json \
--parameters file://aip-vpc-qa-launch-params-eu-central-1.json \
--capabilities CAPABILITY_IAM --disable-rollback --region eu-central-1

## Update Stack
aws cloudformation update-stack \
--stack-name aip-qa-vpc \
--template-body file://aip-vpc.cfn.json \
--parameters file://aip-vpc-qa-launch-params-eu-central-1.json \
--capabilities CAPABILITY_IAM --region eu-central-1



##
## -- Prod --
### BI VPC Environments -- Use update-stack once create-stack succeeds
aws cloudformation create-stack \
--stack-name aip-prod-vpc \
--template-body file://aip-vpc.cfn.json \
--parameters file://aip-vpc-prod-launch-params-eu-central-1.json \
--capabilities CAPABILITY_IAM --disable-rollback --region eu-central-1

## Update Stack
aws cloudformation update-stack \
--stack-name aip-prod-vpc \
--template-body file://aip-vpc.cfn.json \
--parameters file://aip-vpc-prod-launch-params-eu-central-1.json \
--capabilities CAPABILITY_IAM --region eu-central-1




########################################
# ------ Ireland EU-west-1 Region ------
########################################

aws cloudformation create-stack \
--stack-name aip-admin-vpc \
--template-body file://aip-vpc-admin.cfn.json \
--parameters file://aip-vpc-admin-launch-params-eu-west-1.json \
--capabilities CAPABILITY_IAM --disable-rollback --region eu-west-1

aws cloudformation update-stack \
--stack-name aip-admin-vpc \
--template-body file://aip-vpc-admin.cfn.json \
--parameters file://aip-vpc-admin-launch-params-eu-west-1.json \
--capabilities CAPABILITY_IAM --region eu-west-1

### VPN connection for BI Administration VPC
aws cloudformation update-stack \
--stack-name aip-admin-vpc-vpn-ireland \
--template-body file://aip-vpc-admin-vpn-ireland-ipam-DE-Wiesbaden-Delkenheim-G20.cfn.json \
--parameters file://aip-vpc-admin-vpn-launch-params-eu-west-1.json \
--capabilities CAPABILITY_IAM --disable-rollback --profile sandbox --region eu-west-1



##
## -- QA --
### BI VPC Environments -- Use update-stack once create-stack succeeds
aws cloudformation create-stack \
--stack-name aip-qa-vpc \
--template-body file://aip-vpc.cfn.json \
--parameters file://aip-vpc-qa-launch-params-eu-west-1.json \
--capabilities CAPABILITY_IAM --disable-rollback --region eu-west-1

## Update Stack
aws cloudformation update-stack \
--stack-name aip-qa-vpc \
--template-body file://aip-vpc.cfn.json \
--parameters file://aip-vpc-qa-launch-params-eu-west-1.json \
--capabilities CAPABILITY_IAM --region eu-west-1



##
## -- Prod --
### BI VPC Environments -- Use update-stack once create-stack succeeds
aws cloudformation create-stack \
--stack-name aip-prod-vpc \
--template-body file://aip-vpc.cfn.json \
--parameters file://aip-vpc-prod-launch-params-eu-west-1.json \
--capabilities CAPABILITY_IAM --disable-rollback --region eu-west-1

## Update Stack
aws cloudformation update-stack \
--stack-name aip-prod-vpc \
--template-body file://aip-vpc.cfn.json \
--parameters file://aip-vpc-prod-launch-params-eu-west-1.json \
--capabilities CAPABILITY_IAM --region eu-west-1




########################################
# ---- Tokyo AP-Northeast-1 Region -----
########################################

### VPN connection for Aliniqbis Administration VPC
aws cloudformation create-stack \
--stack-name aip-admin-vpc-vpn-tokyo \
--template-body file://aip-vpc-admin-vpn-tokyo-ipam-SG-Singapore-SN20.cfn.json \
--parameters file://aip-vpc-admin-vpn-launch-params-ap-northeast-1.json \
--capabilities CAPABILITY_IAM --disable-rollback --region ap-northeast-1



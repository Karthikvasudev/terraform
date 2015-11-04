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


### Abbott AWS -- VPC Environments -- 
##
## -- Dev --
aws cloudformation create-stack \
--stack-name aip-dev-vpc \
--template-body file://aip-vpc.cfn.json \
--parameters file://aip-vpc-dev-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback 

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

##
## -- Prod --
### BI VPC Environments -- Use update-stack once create-stack succeeds
aws cloudformation create-stack \
--stack-name aip-prod-vpc \
--template-body file://aip-vpc.cfn.json \
--parameters file://aip-vpc-prod-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback 







#### --------------------------


### Sandbox -- BI Beanstalk deployment via Master Template -- Sandbox
##
## -- Create Sandbox AWS: Dev environment --
aws cloudformation create-stack \
--stack-name bi-dev-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-master-dev-launch-params-us-east-1-sandbox.json \
--capabilities CAPABILITY_IAM --disable-rollback --profile sandbox

##
## -- Update Sandbox AWS: Dev environment --
aws cloudformation update-stack \
--stack-name bi-dev-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-master-dev-launch-params-us-east-1-sandbox.json \
--capabilities CAPABILITY_IAM  --profile sandbox


## -- Create Sandbox AWS: Test environment --
aws cloudformation create-stack \
--stack-name bi-test-master \
--template-body file://bi-master.cfn.json \
--parameters file://aip-master-test-launch-params-us-east-1-sandbox.json \
--capabilities CAPABILITY_IAM --disable-rollback --profile sandbox

## -- Update Sandbox AWS: Test environment --
aws cloudformation update-stack \
--stack-name bi-test-master \
--template-body file://bi-master.cfn.json \
--parameters file://aip-master-test-launch-params-us-east-1-sandbox.json \
--capabilities CAPABILITY_IAM --profile sandbox


#### --------------------------

### Abbott AWS -- BI Beanstalk deployment via Master Template -- "bi-app-us-east-1"
##
### Dev
## -- Create Abbott AWS: Dev environment --
aws cloudformation create-stack \
--stack-name bi-dev-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-master-dev-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback 

## -- Update Abbott AWS: Dev environment --
aws cloudformation update-stack \
--stack-name bi-dev-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-master-dev-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM

### Test
## -- Create Abbott AWS: Test environment --
aws cloudformation create-stack \
--stack-name bi-test-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-master-test-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback 

## -- Update Abbott AWS: Test environment --
aws cloudformation update-stack \
--stack-name bi-test-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-master-test-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM

### QA
## -- Create Abbott AWS: Test environment --
aws cloudformation create-stack \
--stack-name bi-qa-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-master-qa-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback 

## -- Update Abbott AWS: Test environment --
aws cloudformation update-stack \
--stack-name bi-qa-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-master-qa-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM

### Prod
## -- Create Abbott AWS: Test environment --
aws cloudformation create-stack \
--stack-name bi-prod-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-master-prod-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback 

## -- Update Abbott AWS: Test environment --
aws cloudformation update-stack \
--stack-name bi-prod-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-master-prod-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM




### Abbott AWS -- Beanstalk App -- Platform Services "aip-us-east-1"
##
### Dev
## -- Create Abbott AWS: Dev environment --
aws cloudformation create-stack \
--stack-name aip-platform-dev-master \
--template-body file://aip-platform-master.cfn.json \
--parameters file://aip-platform-master-dev-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback

## -- Update Abbott AWS: Dev environment --
aws cloudformation update-stack \
--stack-name aip-platform-dev-master \
--template-body file://aip-platform-master.cfn.json \
--parameters file://aip-platform-master-dev-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM 



## -- Create Abbott AWS: Test environment --
aws cloudformation create-stack \
--stack-name aip-platform-test-master \
--template-body file://aip-platform-master.cfn.json \
--parameters file://aip-platform-master-test-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback


## -- update Abbott AWS: Test environment --
aws cloudformation update-stack \
--stack-name aip-platform-test-master \
--template-body file://aip-platform-master.cfn.json \
--parameters file://aip-platform-master-test-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback


### Abbott AWS -- Beanstalk App -- Proxy Services ""
##
### Dev
## -- Create Abbott AWS: Dev environment --
aws cloudformation create-stack \
--stack-name aip-proxy-dev-master \
--template-body file://aip-proxy-master.cfn.json \
--parameters file://aip-proxy-master-dev-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback

## -- Update Abbott AWS: Dev environment --
aws cloudformation update-stack \
--stack-name aip-proxy-dev-master \
--template-body file://aip-proxy-master.cfn.json \
--parameters file://aip-proxy-master-dev-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM 



### Test
## -- Create Abbott AWS: Test environment --
aws cloudformation create-stack \
--stack-name aip-proxy-test-master \
--template-body file://aip-proxy-master.cfn.json \
--parameters file://aip-proxy-master-test-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback


## -- update Abbott AWS: Test environment --
aws cloudformation update-stack \
--stack-name aip-proxy-test-master \
--template-body file://aip-proxy-master.cfn.json \
--parameters file://aip-proxy-master-test-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback



### Abbott AWS -- Beanstalk App -- ETL Services ""
##
### Dev
## -- Create Abbott AWS: Dev environment --
aws cloudformation create-stack \
--stack-name bit-etl-dev --template-body file://bi-etl-master.cfn.json \
--parameters file://bi-etl-master-dev-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback


## -- Update Abbott AWS: Dev environment --
aws cloudformation update-stack \
--stack-name bit-etl-dev --template-body file://bi-etl-master.cfn.json \
--parameters file://bi-etl-master-dev-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback

## Sandbox

aws cloudformation create-stack \
--stack-name bit-etl-dev --template-body file://bi-etl-master.cfn.json \
--parameters file://bi-etl-master-dev-launch-params-us-east-1-Sandbox.json \
--capabilities CAPABILITY_IAM --disable-rollback


aws cloudformation update-stack \
--stack-name bit-etl-dev --template-body file://bi-etl-master.cfn.json \
--parameters file://bi-etl-master-dev-launch-params-us-east-1-Sandbox.json \
--capabilities CAPABILITY_IAM --disable-rollback



## -- Create Abbott AWS: Test environment --
aws cloudformation create-stack \
--stack-name bit-etl-test --template-body file://bi-etl-master.cfn.json \
--parameters file://bi-etl-master-test-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback


## -- Update Abbott AWS: Test environment --
aws cloudformation Update-stack \
--stack-name bit-etl-test --template-body file://bi-etl-master.cfn.json \
--parameters file://bi-etl-master-test-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback


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
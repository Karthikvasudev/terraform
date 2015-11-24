#Readme.md

### AWS CloudFormation Stack commands for BI Environments
## Copy/Paste into bash shell window
## Note: include --profile sandbox when testing only. Included for safety reasons



### Abbott AWS -- Beanstalk App -- Chronos Services ""
##
##
### Dev
## -- Create Abbott AWS: Dev environment --
aws cloudformation create-stack \
--stack-name aip-chronos-dev-master \
--template-body file://aip-chronos-master.cfn.json \
--parameters file://aip-chronos-dev-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback 

## -- Update Abbott AWS: Dev environment --
aws cloudformation update-stack \
--stack-name aip-chronos-dev-master \
--template-body file://aip-chronos-master.cfn.json \
--parameters file://aip-chronos-dev-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM

### Test
## -- Create Abbott AWS: Test environment --
aws cloudformation create-stack \
--stack-name aip-chronos-test-master \
--template-body file://aip-chronos-master.cfn.json \
--parameters file://aip-chronos-test-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback 

## -- Update Abbott AWS: Test environment --
aws cloudformation update-stack \
--stack-name aip-chronos-test-master \
--template-body file://aip-chronos-master.cfn.json \
--parameters file://aip-chronos-test-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM

### QA
## -- Create Abbott AWS: QA environment --
aws cloudformation create-stack \
--stack-name aip-chronos-qa-master \
--template-body file://aip-chronos-master.cfn.json \
--parameters file://aip-chronos-qa-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback 

## -- Update Abbott AWS: QA environment --
aws cloudformation update-stack \
--stack-name aip-chronos-qa-master \
--template-body file://aip-chronos-master.cfn.json \
--parameters file://aip-chronos-qa-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM

### Prod
## -- Create Abbott AWS: Prod environment --
aws cloudformation create-stack \
--stack-name aip-chronos-prod-master \
--template-body file://aip-chronos-master.cfn.json \
--parameters file://aip-chronos-prod-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback 

## -- Update Abbott AWS: Prod environment --
aws cloudformation update-stack \
--stack-name aip-chronos-prod-master \
--template-body file://aip-chronos-master.cfn.json \
--parameters file://aip-chronos-prod-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM


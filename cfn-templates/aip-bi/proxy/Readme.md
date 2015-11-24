#Readme.md

run AWS CloudFormation Stack commands for BI Environments
Copy/Paste into bash shell window
Note: include --profile sandbox when testing only. Included for safety reasons




### Abbott AWS -- Beanstalk App -- Proxy Services ""
##
### Dev
## -- Create Abbott AWS: Dev environment --
aws cloudformation create-stack \
--stack-name aip-proxy-dev-master \
--template-body file://aip-proxy-master.cfn.json \
--parameters file://aip-proxy-dev-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback

## -- Update Abbott AWS: Dev environment --
aws cloudformation update-stack \
--stack-name aip-proxy-dev-master \
--template-body file://aip-proxy-master.cfn.json \
--parameters file://aip-proxy-dev-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM 


### Test
## -- Create Abbott AWS: Test environment --
aws cloudformation create-stack \
--stack-name aip-proxy-test-master \
--template-body file://aip-proxy-master.cfn.json \
--parameters file://aip-proxy-test-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback

## -- update Abbott AWS: Test environment --
aws cloudformation update-stack \
--stack-name aip-proxy-test-master \
--template-body file://aip-proxy-master.cfn.json \
--parameters file://aip-proxy-test-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM 


### QA
## -- Create Abbott AWS: QA environment --
aws cloudformation create-stack \
--stack-name aip-proxy-qa-master \
--template-body file://aip-proxy-master.cfn.json \
--parameters file://aip-proxy-qa-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback

## -- update Abbott AWS: QA environment --
aws cloudformation update-stack \
--stack-name aip-proxy-qa-master \
--template-body file://aip-proxy-master.cfn.json \
--parameters file://aip-proxy-qa-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM 


### Prod
## -- Create Abbott AWS: Prod environment --
aws cloudformation create-stack \
--stack-name aip-proxy-prod-master \
--template-body file://aip-proxy-master.cfn.json \
--parameters file://aip-proxy-prod-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback


## -- Update Abbott AWS: Prod environment --
aws cloudformation update-stack \
--stack-name aip-proxy-prod-master \
--template-body file://aip-proxy-master.cfn.json \
--parameters file://aip-proxy-prod-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback







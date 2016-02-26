#Readme.md

run AWS CloudFormation Stack commands for BI Environments
Copy/Paste into bash shell window
Note: include --profile sandbox when testing only. Included for safety reasons




### Abbott AWS -- Beanstalk App -- Proxy Services ""
##
### Dev
## -- Create Abbott AWS: Dev environment --
aws cloudformation create-stack \
--stack-name aip-proxy-dev-master2 \
--template-body file://aip-proxy-master.cfn.json \
--parameters file://aip-proxy-dev-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update Abbott AWS: Dev environment --
aws cloudformation update-stack \
--stack-name aip-proxy-dev-master2 \
--template-body file://aip-proxy-master.cfn.json \
--parameters file://aip-proxy-dev-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1


### Test
## -- Create Abbott AWS: Test environment --
aws cloudformation create-stack \
--stack-name aip-proxy-test-master \
--template-body file://aip-proxy-master.cfn.json \
--parameters file://aip-proxy-test-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- update Abbott AWS: Test environment --
aws cloudformation update-stack \
--stack-name aip-proxy-test-master \
--template-body file://aip-proxy-master.cfn.json \
--parameters file://aip-proxy-test-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1


### QA
## -- Create Abbott AWS: QA environment --
aws cloudformation create-stack \
--stack-name aip-proxy-qa-master \
--template-body file://aip-proxy-master.cfn.json \
--parameters file://aip-proxy-qa-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- update Abbott AWS: QA environment --
aws cloudformation update-stack \
--stack-name aip-proxy-qa-master \
--template-body file://aip-proxy-master.cfn.json \
--parameters file://aip-proxy-qa-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1


### Prod
## -- Create Abbott AWS: Prod environment --
aws cloudformation create-stack \
--stack-name aip-proxy-prod-master \
--template-body file://aip-proxy-master.cfn.json \
--parameters file://aip-proxy-prod-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1


## -- Update Abbott AWS: Prod environment --
aws cloudformation update-stack \
--stack-name aip-proxy-prod-master \
--template-body file://aip-proxy-master.cfn.json \
--parameters file://aip-proxy-prod-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1


### Beta
## -- Create Abbott AWS: Beta environment --
aws cloudformation create-stack \
--stack-name aip-proxy-beta-master \
--template-body file://aip-proxy-master.cfn.json \
--parameters file://aip-proxy-beta-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1


## -- Update Abbott AWS: Beta environment --
aws cloudformation update-stack \
--stack-name aip-proxy-beta-master \
--template-body file://aip-proxy-master.cfn.json \
--parameters file://aip-proxy-beta-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1




### DevOps
## -- Create Abbott AWS: DevOps environment --
aws cloudformation create-stack \
--stack-name aip-proxy-devops-master \
--template-body file://aip-proxy-master.cfn.json \
--parameters file://aip-proxy-devops-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1


## -- Update Abbott AWS: DevOps environment --
aws cloudformation update-stack \
--stack-name aip-proxy-devops-master \
--template-body file://aip-proxy-master.cfn.json \
--parameters file://aip-proxy-devops-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM 
--region us-east-1






########################################
# ------ Ireland EU-west-1 Region ------
########################################


### Prod
## -- Create Abbott AWS: Prod environment --
aws cloudformation create-stack \
--stack-name aip-proxy-prod-master \
--template-body file://aip-proxy-master.cfn.json \
--parameters file://aip-proxy-prod-launch-params-eu-west-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region eu-west-1


## -- Update Abbott AWS: Prod environment --
aws cloudformation update-stack \
--stack-name aip-proxy-prod-master \
--template-body file://aip-proxy-master.cfn.json \
--parameters file://aip-proxy-prod-launch-params-eu-west-1.json \
--capabilities CAPABILITY_IAM \
--region eu-west-1



########################################
# ------- Tokyo EU-west-1 Region -------
########################################

### Prod
## -- Create Abbott AWS: Prod environment --
aws cloudformation create-stack \
--stack-name aip-proxy-prod-master \
--template-body file://aip-proxy-master.cfn.json \
--parameters file://aip-proxy-prod-launch-params-ap-northeast-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region ap-northeast-1


## -- Update Abbott AWS: Prod environment --
aws cloudformation update-stack \
--stack-name aip-proxy-prod-master \
--template-body file://aip-proxy-master.cfn.json \
--parameters file://aip-proxy-prod-launch-params-ap-northeast-1.json \
--capabilities CAPABILITY_IAM \
--region ap-northeast-1


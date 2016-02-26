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
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update Abbott AWS: Dev environment --
aws cloudformation update-stack \
--stack-name aip-chronos-dev-master \
--template-body file://aip-chronos-master.cfn.json \
--parameters file://aip-chronos-dev-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1

### Test
## -- Create Abbott AWS: Test environment --
aws cloudformation create-stack \
--stack-name aip-chronos-test-master \
--template-body file://aip-chronos-master.cfn.json \
--parameters file://aip-chronos-test-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update Abbott AWS: Test environment --
aws cloudformation update-stack \
--stack-name aip-chronos-test-master \
--template-body file://aip-chronos-master.cfn.json \
--parameters file://aip-chronos-test-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1

### QA
## -- Create Abbott AWS: QA environment --
aws cloudformation create-stack \
--stack-name aip-chronos-qa-master \
--template-body file://aip-chronos-master.cfn.json \
--parameters file://aip-chronos-qa-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update Abbott AWS: QA environment --
aws cloudformation update-stack \
--stack-name aip-chronos-qa-master \
--template-body file://aip-chronos-master.cfn.json \
--parameters file://aip-chronos-qa-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1


### Prod
## -- Create Abbott AWS: Prod environment --
aws cloudformation create-stack \
--stack-name aip-chronos-prod-master \
--template-body file://aip-chronos-master.cfn.json \
--parameters file://aip-chronos-prod-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update Abbott AWS: Prod environment --
aws cloudformation update-stack \
--stack-name aip-chronos-prod-master \
--template-body file://aip-chronos-master.cfn.json \
--parameters file://aip-chronos-prod-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1


### Beta
## -- Create Abbott AWS: Beta environment --
aws cloudformation create-stack \
--stack-name aip-chronos-beta-master \
--template-body file://aip-chronos-master.cfn.json \
--parameters file://aip-chronos-beta-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update Abbott AWS: Beta environment --
aws cloudformation update-stack \
--stack-name aip-chronos-beta-master \
--template-body file://aip-chronos-master.cfn.json \
--parameters file://aip-chronos-beta-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1


### DevOps
## -- Create Abbott AWS: devops environment --
aws cloudformation create-stack \
--stack-name aip-chronos-devops-master \
--template-body file://aip-chronos-master.cfn.json \
--parameters file://aip-chronos-devops-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update Abbott AWS: devops environment --
aws cloudformation update-stack \
--stack-name aip-chronos-devops-master \
--template-body file://aip-chronos-master.cfn.json \
--parameters file://aip-chronos-devops-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1





########################################
# ------ Ireland EU-west-1 Region ------
########################################


### Prod
## -- Create Abbott AWS: Prod environment --
aws cloudformation create-stack \
--stack-name aip-chronos-prod-master \
--template-body file://aip-chronos-master.cfn.json \
--parameters file://aip-chronos-prod-launch-params-eu-west-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region eu-west-1

## -- Update Abbott AWS: Prod environment --
aws cloudformation update-stack \
--stack-name aip-chronos-prod-master \
--template-body file://aip-chronos-master.cfn.json \
--parameters file://aip-chronos-prod-launch-params-eu-west-1.json \
--capabilities CAPABILITY_IAM \
--region eu-west-1



########################################
# ---- Tokyo AP-NorthEast-1 Region -----
########################################


### Prod
## -- Create Abbott AWS: Prod environment --
aws cloudformation create-stack \
--stack-name aip-chronos-prod-master \
--template-body file://aip-chronos-master.cfn.json \
--parameters file://aip-chronos-prod-launch-params-ap-northeast-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region ap-northeast-1

## -- Update Abbott AWS: Prod environment --
aws cloudformation update-stack \
--stack-name aip-chronos-prod-master \
--template-body file://aip-chronos-master.cfn.json \
--parameters file://aip-chronos-prod-launch-params-ap-northeast-1.json \
--capabilities CAPABILITY_IAM \
--region ap-northeast-1

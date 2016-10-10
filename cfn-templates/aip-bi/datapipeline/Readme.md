#Readme.md

run AWS CloudFormation Stack commands for BI Environments
Copy/Paste into bash shell window
Note: include --profile sandbox when testing only. Included for safety reasons




### Abbott AWS -- Beanstalk App -- Data Pipeline Services ""
##
##
### Dev
## -- Create Abbott AWS: Dev environment --
aws cloudformation create-stack \
--stack-name bi-datapipeline-service-dev-master \
--template-body file://bi-datapipeline-service-master.cfn.json \
--parameters file://bi-datapipeline-service-dev-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update Abbott AWS: Dev environment --
aws cloudformation update-stack \
--stack-name bi-datapipeline-service-dev-master \
--template-body file://bi-datapipeline-service-master.cfn.json \
--parameters file://bi-datapipeline-service-dev-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1

### Test
## -- Create Abbott AWS: Test environment --
aws cloudformation create-stack \
--stack-name bi-datapipeline-service-test-master \
--template-body file://bi-datapipeline-service-master.cfn.json \
--parameters file://bi-datapipeline-service-test-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update Abbott AWS: Test environment --
aws cloudformation update-stack \
--stack-name bi-datapipeline-service-test-master \
--template-body file://bi-datapipeline-service-master.cfn.json \
--parameters file://bi-datapipeline-service-test-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1

### QA
## -- Create Abbott AWS: QA environment --
aws cloudformation create-stack \
--stack-name bi-datapipeline-service-qa-master \
--template-body file://bi-datapipeline-service-master.cfn.json \
--parameters file://bi-datapipeline-service-qa-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update Abbott AWS: QA environment --
aws cloudformation update-stack \
--stack-name bi-datapipeline-service-qa-master \
--template-body file://bi-datapipeline-service-master.cfn.json \
--parameters file://bi-datapipeline-service-qa-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1

### Prod
## -- Create Abbott AWS: Prod environment --
aws cloudformation create-stack \
--stack-name bi-datapipeline-service-prod-master \
--template-body file://bi-datapipeline-service-master.cfn.json \
--parameters file://bi-datapipeline-service-prod-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update Abbott AWS: Prod environment --
aws cloudformation update-stack \
--stack-name bi-datapipeline-service-prod-master \
--template-body file://bi-datapipeline-service-master.cfn.json \
--parameters file://bi-datapipeline-service-prod-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1


### Prod2
## -- Create Abbott AWS: prod2 environment --
aws cloudformation create-stack \
--stack-name bi-datapipeline-service-prod2-master \
--template-body file://bi-datapipeline-service-master.cfn.json \
--parameters file://bi-datapipeline-service-prod2-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update Abbott AWS: prod2 environment --
aws cloudformation update-stack \
--stack-name bi-datapipeline-service-prod2-master \
--template-body file://bi-datapipeline-service-master.cfn.json \
--parameters file://bi-datapipeline-service-prod2-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1



### Beta
## -- Create Abbott AWS: Beta environment --
aws cloudformation create-stack \
--stack-name bi-datapipeline-service-beta-master \
--template-body file://bi-datapipeline-service-master.cfn.json \
--parameters file://bi-datapipeline-service-beta-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update Abbott AWS: Beta environment --
aws cloudformation update-stack \
--stack-name bi-datapipeline-service-beta-master \
--template-body file://bi-datapipeline-service-master.cfn.json \
--parameters file://bi-datapipeline-service-beta-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1


### DevOps
## -- Create Abbott AWS: DevOps environment --
aws cloudformation create-stack \
--stack-name bi-datapipeline-service-devops-master \
--template-body file://bi-datapipeline-service-master.cfn.json \
--parameters file://bi-datapipeline-service-devops-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update Abbott AWS: DevOps environment --
aws cloudformation update-stack \
--stack-name bi-datapipeline-service-devops-master \
--template-body file://bi-datapipeline-service-master.cfn.json \
--parameters file://bi-datapipeline-service-devops-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1




########################################
# ------ Ireland EU-west-1 Region ------
########################################


### Prod
aws cloudformation create-stack \
--stack-name bi-datapipeline-service-prod-master \
--template-body file://bi-datapipeline-service-master.cfn.json \
--parameters file://bi-datapipeline-service-prod-launch-params-eu-west-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region eu-west-1

## -- Update Abbott AWS: Prod environment --
aws cloudformation update-stack \
--stack-name bi-datapipeline-service-prod-master \
--template-body file://bi-datapipeline-service-master.cfn.json \
--parameters file://bi-datapipeline-service-prod-launch-params-eu-west-1.json \
--capabilities CAPABILITY_IAM \
--region eu-west-1





########################################
# ---- Tokyo AP-NorthEast-1 Region -----
########################################

### Prod
aws cloudformation create-stack \
--stack-name bi-datapipeline-service-prod-master \
--template-body file://bi-datapipeline-service-master.cfn.json \
--parameters file://bi-datapipeline-service-prod-launch-params-ap-northeast-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region ap-northeast-1

## -- Update Abbott AWS: Prod environment --
aws cloudformation update-stack \
--stack-name bi-datapipeline-service-prod-master \
--template-body file://bi-datapipeline-service-master.cfn.json \
--parameters file://bi-datapipeline-service-prod-launch-params-ap-northeast-1.json \
--capabilities CAPABILITY_IAM \
--region ap-northeast-1



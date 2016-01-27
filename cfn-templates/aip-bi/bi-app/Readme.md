#Readme.md

## AWS CloudFormation Stack commands for BI App per Environment
##
## Copy/Paste into bash shell window
### Note: include --profile sandbox when testing only. Included for safety reasons



### Abbott AWS -- BI Beanstalk deployment via Master Template
##
### Dev
## -- Create Abbott AWS: Dev environment --
aws cloudformation create-stack \
--stack-name bi-dev-master2 \
--template-body file://bi-master.cfn.json \
--parameters file://bi-dev-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update Abbott AWS: Dev environment --
aws cloudformation update-stack \
--stack-name bi-dev-master2 \
--template-body file://bi-master.cfn.json \
--parameters file://bi-dev-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1


### Test
## -- Create Abbott AWS: Test environment --
aws cloudformation create-stack \
--stack-name bi-test-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-test-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update Abbott AWS: Test environment --
aws cloudformation update-stack \
--stack-name bi-test-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-test-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM 
--region us-east-1


### QA
## -- Create Abbott AWS: QA environment --
aws cloudformation create-stack \
--stack-name bi-qa-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-qa-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update Abbott AWS: QA environment --
aws cloudformation update-stack \
--stack-name bi-qa-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-qa-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1


### Prod
## -- Create Abbott AWS: Prod environment --
aws cloudformation create-stack \
--stack-name bi-prod-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-prod-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update Abbott AWS: Prod environment --
aws cloudformation update-stack \
--stack-name bi-prod-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-prod-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1


### Beta
## -- Create Abbott AWS: Beta environment --
aws cloudformation create-stack \
--stack-name bi-beta-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-beta-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update Abbott AWS: Beta environment --
aws cloudformation update-stack \
--stack-name bi-beta-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-beta-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1





### DevOps
## -- Create Abbott AWS: DevOps environment --
aws cloudformation create-stack \
--stack-name bi-devops-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-devops-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update Abbott AWS: devops environment --
aws cloudformation update-stack \
--stack-name bi-devops-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-devops-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1




########################################
# ------ Ireland EU-west-1 Region ------
########################################


### Prod
## -- Create Abbott AWS: Prod environment --
aws cloudformation create-stack \
--stack-name bi-prod-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-prod-launch-params-eu-west-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region eu-west-1

## -- Update Abbott AWS: Prod environment --
aws cloudformation update-stack \
--stack-name bi-prod-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-prod-launch-params-eu-west-1.json \
--capabilities CAPABILITY_IAM \
--region eu-west-1

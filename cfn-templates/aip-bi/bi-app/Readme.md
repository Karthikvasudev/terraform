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
--stack-name bi-dev-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-dev-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback 

## -- Update Abbott AWS: Dev environment --
aws cloudformation update-stack \
--stack-name bi-dev-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-dev-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM


### Test
## -- Create Abbott AWS: Test environment --
aws cloudformation create-stack \
--stack-name bi-test-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-test-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback 

## -- Update Abbott AWS: Test environment --
aws cloudformation update-stack \
--stack-name bi-test-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-test-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM


### QA
## -- Create Abbott AWS: QA environment --
aws cloudformation create-stack \
--stack-name bi-qa-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-qa-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback 

## -- Update Abbott AWS: QA environment --
aws cloudformation update-stack \
--stack-name bi-qa-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-qa-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM


### Prod
## -- Create Abbott AWS: Prod environment --
aws cloudformation create-stack \
--stack-name bi-prod-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-prod-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback 

## -- Update Abbott AWS: Prod environment --
aws cloudformation update-stack \
--stack-name bi-prod-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-prod-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM




### DevOps
## -- Create Abbott AWS: DevOps environment --
aws cloudformation create-stack \
--stack-name bi-devops-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-devops-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback 

## -- Update Abbott AWS: devops environment --
aws cloudformation update-stack \
--stack-name bi-devops-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-devops-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM

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
--capabilities CAPABILITY_IAM --disable-rollback 

## -- Update Abbott AWS: Dev environment --
aws cloudformation update-stack \
--stack-name bi-datapipeline-service-dev-master \
--template-body file://bi-datapipeline-service-master.cfn.json \
--parameters file://bi-datapipeline-service-dev-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM

### Test
## -- Create Abbott AWS: Test environment --
aws cloudformation create-stack \
--stack-name bi-datapipeline-service-test-master \
--template-body file://bi-datapipeline-service-master.cfn.json \
--parameters file://bi-datapipeline-service-test-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback 

## -- Update Abbott AWS: Test environment --
aws cloudformation update-stack \
--stack-name bi-datapipeline-service-test-master \
--template-body file://bi-datapipeline-service-master.cfn.json \
--parameters file://bi-datapipeline-service-test-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM

### QA
## -- Create Abbott AWS: QA environment --
aws cloudformation create-stack \
--stack-name bi-datapipeline-service-qa-master \
--template-body file://bi-datapipeline-service-master.cfn.json \
--parameters file://bi-datapipeline-service-qa-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback 

## -- Update Abbott AWS: QA environment --
aws cloudformation update-stack \
--stack-name bi-datapipeline-service-qa-master \
--template-body file://bi-datapipeline--master.cfn.json \
--parameters file://bi-datapipeline-service-qa-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM

### Prod
## -- Create Abbott AWS: Prod environment --
aws cloudformation create-stack \
--stack-name bi-datapipeline-service-prod-master \
--template-body file://bi-datapipeline-service-master.cfn.json \
--parameters file://bi-datapipeline-service-prod-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback 

## -- Update Abbott AWS: Prod environment --
aws cloudformation update-stack \
--stack-name bi-datapipeline-service-prod-master \
--template-body file://bi-datapipeline-service-master.cfn.json \
--parameters file://bi-datapipeline-service-prod-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM






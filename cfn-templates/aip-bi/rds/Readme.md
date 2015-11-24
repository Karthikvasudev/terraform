#Readme.md

AWS CloudFormation Stack commands for RDS Environment
Copy/Paste into bash shell window
Note: include --profile sandbox when testing only. Included for safety reasons
Note: No templates are required to be uploaded to S3 bucket for this stack



### Abbott AWS -- RDS Master Template -- 
##
### Dev
## -- Create Abbott AWS: Dev environment --
aws cloudformation create-stack \
--stack-name bi-dev-rds-master \
--template-body file://bi-rds.cfn.json \
--parameters file://bi-rds-dev-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback 

## -- Update Abbott AWS: Dev environment --
aws cloudformation update-stack \
--stack-name bi-dev-rds-master \
--template-body file://bi-rds.cfn.json \
--parameters file://bi-rds-dev-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM

### Test
## -- Create Abbott AWS: Test environment --
aws cloudformation create-stack \
--stack-name bi-test-rds-master \
--template-body file://bi-rds.cfn.json \
--parameters file://bi-rds-test-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback 

## -- Update Abbott AWS: Test environment --
aws cloudformation update-stack \
--stack-name bi-test-rds-master \
--template-body file://bi-rds.cfn.json \
--parameters file://bi-rds-test-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM

### QA
## -- Create Abbott AWS: QA environment --
aws cloudformation create-stack \
--stack-name bi-qa-rds-master \
--template-body file://bi-rds.cfn.json \
--parameters file://bi-rds-qa-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback 

## -- Update Abbott AWS: QA environment --
aws cloudformation update-stack \
--stack-name bi-qa-rds-master \
--template-body file://bi-rds.cfn.json \
--parameters file://bi-rds-qa-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM

### Prod
## -- Create Abbott AWS: Prod environment --
aws cloudformation create-stack \
--stack-name bi-prod-rds-master \
--template-body file://bi-rds.cfn.json \
--parameters file://bi-rds-prod-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback 

## -- Update Abbott AWS: Prod environment --
aws cloudformation update-stack \
--stack-name bi-prod-rds-master \
--template-body file://bi-rds.cfn.json \
--parameters file://bi-rds-prod-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM

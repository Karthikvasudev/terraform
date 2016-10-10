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
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update Abbott AWS: Dev environment --
aws cloudformation update-stack \
--stack-name bi-dev-rds-master \
--template-body file://bi-rds.cfn.json \
--parameters file://bi-rds-dev-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1

### Test
## -- Create Abbott AWS: Test environment --
aws cloudformation create-stack \
--stack-name bi-test-rds-master \
--template-body file://bi-rds.cfn.json \
--parameters file://bi-rds-test-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update Abbott AWS: Test environment --
aws cloudformation update-stack \
--stack-name bi-test-rds-master \
--template-body file://bi-rds.cfn.json \
--parameters file://bi-rds-test-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1

### QA
## -- Create Abbott AWS: QA environment --
aws cloudformation create-stack \
--stack-name bi-qa-rds-master \
--template-body file://bi-rds.cfn.json \
--parameters file://bi-rds-qa-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update Abbott AWS: QA environment --
aws cloudformation update-stack \
--stack-name bi-qa-rds-master \
--template-body file://bi-rds.cfn.json \
--parameters file://bi-rds-qa-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1

### Prod
## -- Create Abbott AWS: Prod environment --
aws cloudformation create-stack \
--stack-name bi-prod-rds-master \
--template-body file://bi-rds.cfn.json \
--parameters file://bi-rds-prod-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update Abbott AWS: Prod environment --
aws cloudformation update-stack \
--stack-name bi-prod-rds-master \
--template-body file://bi-rds.cfn.json \
--parameters file://bi-rds-prod-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1


### Prod2
## -- Create Abbott AWS: prod2 environment --
aws cloudformation create-stack \
--stack-name bi-prod2-rds-master \
--template-body file://bi-rds.cfn.json \
--parameters file://bi-rds-prod2-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update Abbott AWS: prod2 environment --
aws cloudformation update-stack \
--stack-name bi-prod2-rds-master \
--template-body file://bi-rds.cfn.json \
--parameters file://bi-rds-prod2-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1


### Beta
## -- Create Abbott AWS: Beta environment --
aws cloudformation create-stack \
--stack-name bi-beta-rds-master2 \
--template-body file://bi-rds.cfn.json \
--parameters file://bi-rds-beta-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update Abbott AWS: Beta environment --
aws cloudformation update-stack \
--stack-name bi-beta-rds-master \
--template-body file://bi-rds.cfn.json \
--parameters file://bi-rds-beta-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1




### DevOps
## -- Create Abbott AWS: DevOps environment --
aws cloudformation create-stack \
--stack-name bi-devops-rds-master \
--template-body file://bi-rds.cfn.json \
--parameters file://bi-rds-devops-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update Abbott AWS: DevOps environment --
aws cloudformation update-stack \
--stack-name bi-devops-rds-master \
--template-body file://bi-rds.cfn.json \
--parameters file://bi-rds-devops-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1



########################################
# ------ Ireland EU-west-1 Region ------
########################################


### Prod
## -- Create Abbott AWS: Prod environment --
aws cloudformation create-stack \
--stack-name aip-rds-prod-master \
--template-body file://bi-rds.cfn.json \
--parameters file://bi-rds-prod-launch-params-eu-west-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region eu-west-1

## -- Update Abbott AWS: Prod environment --
aws cloudformation update-stack \
--stack-name aip-rds-prod-master \
--template-body file://bi-rds.cfn.json \
--parameters file://bi-rds-prod-launch-params-eu-west-1.json \
--capabilities CAPABILITY_IAM \
--region eu-west-1




########################################
# ---- Tokyo AP-NorthEast-1 Region -----
########################################

### Prod
## -- Create Abbott AWS: Prod environment --
aws cloudformation create-stack \
--stack-name aip-rds-prod-master \
--template-body file://bi-rds.cfn.json \
--parameters file://bi-rds-prod-launch-params-ap-northeast-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region ap-northeast-1

## -- Update Abbott AWS: Prod environment --
aws cloudformation update-stack \
--stack-name aip-rds-prod-master \
--template-body file://bi-rds.cfn.json \
--parameters file://bi-rds-prod-launch-params-ap-northeast-1.json \
--capabilities CAPABILITY_IAM \
--region ap-northeast-1

#Readme.md

run AWS CloudFormation Stack commands for BI Environments
Copy/Paste into bash shell window
Note: include --profile sandbox when testing only. Included for safety reasons



## -- Create Abbott AWS: DevOps environment --


aws cloudformation create-stack \
--stack-name bi-etl-devops-master --template-body file://bi-etl-master.cfn.json \
--parameters file://bi-etl-devops-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1


## -- Update Abbott AWS: DevOps environment --
aws cloudformation update-stack \
--stack-name bi-etl-devops-master --template-body file://bi-etl-master.cfn.json \
--parameters file://bi-etl-devops-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1

### Note: Create the common Lambda function handler for S3-Archive by running the installer script located in "aip-aws-devops/cfn-templates/aip-bi/lambda/archive-s3/" folder.


### Abbott AWS -- Beanstalk App -- ETL Services ""
##
### Dev
## -- Create Abbott AWS: Dev environment --

aws cloudformation create-stack \
--stack-name bi-etl-dev-master --template-body file://bi-etl-master.cfn.json \
--parameters file://bi-etl-dev-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1


## -- Update Abbott AWS: Dev environment --
aws cloudformation update-stack  \
--stack-name bi-etl-dev-master --template-body file://bi-etl-master.cfn.json \
--parameters file://bi-etl-dev-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1

### Note: Create the common Lambda function handler for S3-Archive by running the installer script located in "aip-aws-devops/cfn-templates/aip-bi/lambda/archive-s3/" folder.



## -- Create Abbott AWS: Test environment --
aws cloudformation create-stack \
--stack-name bi-etl-test-master --template-body file://bi-etl-master.cfn.json \
--parameters file://bi-etl-test-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1


## -- Update Abbott AWS: Test environment --
aws cloudformation update-stack \
--stack-name bi-etl-test-master --template-body file://bi-etl-master.cfn.json \
--parameters file://bi-etl-test-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1


## -- Create Abbott AWS: QA environment --
aws cloudformation create-stack \
--stack-name bi-etl-qa-master --template-body file://bi-etl-master.cfn.json \
--parameters file://bi-etl-qa-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update Abbott AWS: QA environment --
aws cloudformation update-stack \
--stack-name bi-etl-qa-master --template-body file://bi-etl-master.cfn.json \
--parameters file://bi-etl-qa-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1


## -- Create Abbott AWS: Prod environment --
aws cloudformation create-stack \
--stack-name bi-etl-prod-master --template-body file://bi-etl-master.cfn.json \
--parameters file://bi-etl-prod-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update Abbott AWS: Prod environment --
aws cloudformation update-stack \
--stack-name bi-etl-prod-master --template-body file://bi-etl-master.cfn.json \
--parameters file://bi-etl-prod-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1


## -- Create Abbott AWS: Prod2 environment --
aws cloudformation create-stack \
--stack-name bi-etl-prod2-master --template-body file://bi-etl-master.cfn.json \
--parameters file://bi-etl-prod2-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update Abbott AWS: prod2 environment --
aws cloudformation update-stack \
--stack-name bi-etl-prod2-master --template-body file://bi-etl-master.cfn.json \
--parameters file://bi-etl-prod2-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1


## -- Create Abbott AWS: Beta environment --
aws cloudformation create-stack \
--stack-name bi-etl-beta-master --template-body file://bi-etl-master.cfn.json \
--parameters file://bi-etl-beta-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1


## -- Update Abbott AWS: Beta environment --
aws cloudformation update-stack \
--stack-name bi-etl-beta-master --template-body file://bi-etl-master.cfn.json \
--parameters file://bi-etl-beta-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1




########################################
# ------ Ireland EU-west-1 Region ------
########################################


### Prod
## -- Create Abbott AWS: Prod environment --

## -- Create Abbott AWS: Prod environment --
aws cloudformation create-stack \
--stack-name bi-etl-prod-master --template-body file://bi-etl-master.cfn.json \
--parameters file://bi-etl-prod-launch-params-eu-west-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region eu-west-1


## -- Update Abbott AWS: Prod environment --
aws cloudformation update-stack \
--stack-name bi-etl-prod-master --template-body file://bi-etl-master.cfn.json \
--parameters file://bi-etl-prod-launch-params-eu-west-1.json \
--capabilities CAPABILITY_IAM \
--region eu-west-1




########################################
# ---- Tokyo AP-NorthEast-1 Region -----
########################################


### Prod
## -- Create Abbott AWS: Prod environment --
aws cloudformation create-stack \
--stack-name bi-etl-prod-master --template-body file://bi-etl-master.cfn.json \
--parameters file://bi-etl-prod-launch-params-ap-northeast-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region ap-northeast-1


## -- Update Abbott AWS: Prod environment --
aws cloudformation update-stack \
--stack-name bi-etl-prod-master --template-body file://bi-etl-master.cfn.json \
--parameters file://bi-etl-prod-launch-params-ap-northeast-1.json \
--capabilities CAPABILITY_IAM \
--region ap-northeast-1




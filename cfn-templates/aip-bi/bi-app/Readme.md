#Readme.md

## AWS CloudFormation Stack commands for BI App per Environment
##
## Copy/Paste into bash shell window
### Note: include --profile sandbox when testing only. Included for safety reasons


### DevOps
## -- Create Abbott AWS: DevOps environment --
aws cloudformation create-stack \
--stack-name bi-app-devops-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-devops-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update Abbott AWS: devops environment --
aws cloudformation update-stack \
--stack-name bi-app-devops-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-devops-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1


## AWS resources

### Note: Create the common Lambda function handler for S3-Archive by running the installer script located in "aip-aws-devops/cfn-templates/aip-bi/lambda/archive-s3/" folder.


aws cloudformation create-stack \
--stack-name bi-app-aws-resources-devops-master \
--template-body file://bi-aws-resources.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=devops \
ParameterKey=LambdaFunctionName,ParameterValue=s3-copy2archive-lambda \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

aws cloudformation update-stack \
--stack-name bi-app-aws-resources-devops-master \
--template-body file://bi-aws-resources.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=devops \
ParameterKey=LambdaFunctionName,ParameterValue=s3-copy2archive-lambda \
--capabilities CAPABILITY_IAM \
--region us-east-1


### Note: After the stack is created,In the console, go to the lambda function (s3-copy2archive-lambda) and add the event source of the lambda to the sns topic(bi-devops-sns-file-uploaded) for the buckets.



### Abbott AWS -- BI Beanstalk deployment via Master Template
##
### Dev
## -- Create Abbott AWS: Dev environment --
aws cloudformation create-stack \
--stack-name bi-app-dev-master2 \
--template-body file://bi-master.cfn.json \
--parameters file://bi-dev-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update Abbott AWS: Dev environment --
aws cloudformation update-stack \
--stack-name bi-app-dev-master2 \
--template-body file://bi-master.cfn.json \
--parameters file://bi-dev-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1


## AWS resources

### Note: Create the common Lambda function handler for S3-Archive by running the installer script located in "aip-aws-devops/cfn-templates/aip-bi/lambda/archive-s3/" folder.

aws cloudformation create-stack \
--stack-name bi-app-aws-resources-dev-master \
--template-body file://bi-aws-resources.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=dev \
ParameterKey=LambdaFunctionName,ParameterValue=s3-copy2archive-lambda \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

aws cloudformation update-stack \
--stack-name bi-app-aws-resources-dev-master \
--template-body file://bi-aws-resources.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=dev \
ParameterKey=LambdaFunctionName,ParameterValue=s3-copy2archive-lambda \
--capabilities CAPABILITY_IAM \
--region us-east-1


### Note: After the stack is created,In the console, go to the lambda function (s3-copy2archive-lambda) and add the event source of the lambda to the sns topic(bi-devops-sns-file-uploaded) for the buckets.


### Test
## -- Create Abbott AWS: Test environment --
aws cloudformation create-stack \
--stack-name bi-app-test-master1 \
--template-body file://bi-master.cfn.json \
--parameters file://bi-test-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update Abbott AWS: Test environment --
aws cloudformation update-stack \
--stack-name bi-app-test-master1 \
--template-body file://bi-master.cfn.json \
--parameters file://bi-test-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM
--region us-east-1


## AWS resources
aws cloudformation create-stack \
--stack-name bi-app-aws-resources-test-master \
--template-body file://bi-aws-resources.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=test \
ParameterKey=LambdaFunctionName,ParameterValue=s3-copy2archive-lambda \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

aws cloudformation update-stack \
--stack-name bi-app-aws-resources-test-master \
--template-body file://bi-aws-resources.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=test \
ParameterKey=LambdaFunctionName,ParameterValue=s3-copy2archive-lambda \
--capabilities CAPABILITY_IAM \
--region us-east-1

### QA
## -- Create Abbott AWS: QA environment --
aws cloudformation create-stack \
--stack-name bi-app-qa-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-qa-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update Abbott AWS: QA environment --
aws cloudformation update-stack \
--stack-name bi-app-qa-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-qa-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1


## AWS resources
aws cloudformation create-stack \
--stack-name bi-app-aws-resources-qa-master \
--template-body file://bi-aws-resources.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=qa \
ParameterKey=LambdaFunctionName,ParameterValue=s3-copy2archive-lambda \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

aws cloudformation update-stack \
--stack-name bi-app-aws-resources-qa-master \
--template-body file://bi-aws-resources.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=qa \
ParameterKey=LambdaFunctionName,ParameterValue=s3-copy2archive-lambda \
--capabilities CAPABILITY_IAM \
--region us-east-1



### Prod
## -- Create Abbott AWS: Prod environment --
aws cloudformation create-stack \
--stack-name bi-app-prod-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-prod-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update Abbott AWS: Prod environment --
aws cloudformation update-stack \
--stack-name bi-app-prod-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-prod-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1

## AWS resources
aws cloudformation create-stack \
--stack-name bi-app-aws-resources-prod-master \
--template-body file://bi-aws-resources.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=prod \
ParameterKey=LambdaFunctionName,ParameterValue=s3-copy2archive-lambda \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

aws cloudformation update-stack \
--stack-name bi-app-aws-resources-prod-master \
--template-body file://bi-aws-resources.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=prod \
ParameterKey=LambdaFunctionName,ParameterValue=s3-copy2archive-lambda \
--capabilities CAPABILITY_IAM \
--region us-east-1


### Prod2
## -- Create Abbott AWS: prod2 environment --
aws cloudformation create-stack \
--stack-name bi-app-prod2-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-prod2-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update Abbott AWS: prod2 environment --
aws cloudformation update-stack \
--stack-name bi-app-prod2-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-prod2-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1

## AWS resources
aws cloudformation create-stack \
--stack-name bi-app-aws-resources-prod2-master \
--template-body file://bi-aws-resources.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=prod2 \
ParameterKey=LambdaFunctionName,ParameterValue=s3-copy2archive-lambda \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

aws cloudformation update-stack \
--stack-name bi-app-aws-resources-prod2-master \
--template-body file://bi-aws-resources.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=prod2 \
ParameterKey=LambdaFunctionName,ParameterValue=s3-copy2archive-lambda \
--capabilities CAPABILITY_IAM \
--region us-east-1




### Beta
## -- Create Abbott AWS: Beta environment --
aws cloudformation create-stack \
--stack-name bi-app-beta-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-beta-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update Abbott AWS: Beta environment --
aws cloudformation update-stack \
--stack-name bi-app-beta-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-beta-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1


## AWS resources

aws cloudformation create-stack \
--stack-name bi-app-aws-resources-beta-master \
--template-body file://bi-aws-resources.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=beta \
ParameterKey=LambdaFunctionName,ParameterValue=s3-copy2archive-lambda \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

aws cloudformation update-stack \
--stack-name bi-app-aws-resources-beta-master \
--template-body file://bi-aws-resources.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=beta \
ParameterKey=LambdaFunctionName,ParameterValue=s3-copy2archive-lambda \
--capabilities CAPABILITY_IAM \
--region us-east-1






########################################
# ------ Ireland EU-west-1 Region ------
########################################

### Prod
## -- Create Abbott AWS: Prod environment --
aws cloudformation create-stack \
--stack-name bi-app-prod-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-prod-launch-params-eu-west-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region eu-west-1

## -- Update Abbott AWS: Prod environment --
aws cloudformation update-stack \
--stack-name bi-app-prod-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-prod-launch-params-eu-west-1.json \
--capabilities CAPABILITY_IAM \
--region eu-west-1


## AWS resources
aws cloudformation create-stack \
--stack-name bi-app-aws-resources-prod-master \
--template-body file://bi-aws-resources.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=prod \
ParameterKey=LambdaFunctionName,ParameterValue=s3-copy2archive-lambda \
--capabilities CAPABILITY_IAM --disable-rollback \
--region eu-west-1

aws cloudformation update-stack \
--stack-name bi-app-aws-resources-prod-master \
--template-body file://bi-aws-resources.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=prod \
ParameterKey=LambdaFunctionName,ParameterValue=s3-copy2archive-lambda \
--capabilities CAPABILITY_IAM \
--region eu-west-1



########################################
# ---- Tokyo AP-Northeast-1 Region -----
########################################


### Prod
## -- Create Abbott AWS: Prod environment --
aws cloudformation create-stack \
--stack-name bi-app-prod-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-prod-launch-params-ap-northeast-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region ap-northeast-1

## -- Update Abbott AWS: Prod environment --
aws cloudformation update-stack \
--stack-name bi-app-prod-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-prod-launch-params-ap-northeast-1.json \
--capabilities CAPABILITY_IAM \
--region ap-northeast-1


## AWS resources
aws cloudformation create-stack \
--stack-name bi-app-aws-resources-prod-master \
--template-body file://bi-aws-resources.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=prod \
ParameterKey=LambdaFunctionName,ParameterValue=s3-copy2archive-lambda \
--capabilities CAPABILITY_IAM --disable-rollback \
--region ap-northeast-1


aws cloudformation update-stack \
--stack-name bi-app-aws-resources-prod-master \
--template-body file://bi-aws-resources.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=prod \
ParameterKey=LambdaFunctionName,ParameterValue=s3-copy2archive-lambda \
--capabilities CAPABILITY_IAM \
--region ap-northeast-1

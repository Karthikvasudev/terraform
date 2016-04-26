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

### Note : Clone the aip-aws-devops code commit repository (master branch ), Upload the lambda_handler.zip (lambda fn code) from the "aip-aws-devops/cfn-templates/aip-bi/lambda/archive-s3/" to the bucket "aip-devops-us-east-1-661072482170/lambda/s3Archival/"

aws lambda create-function --function-name s3-copy2archive-lambda-fromAWSCLI \
--runtime python2.7 \
--role "arn:aws:iam::661072482170:role/s3_lambda_copy" \
--handler lambda_handler.lambda_handler \
--code https://s3.amazonaws.com/aip-devops-us-east-1-661072482170/lambda/s3Archival/lambda_handler.zip \
--description "Copy a S3 Put object to the Archive Bucket, Glacier" \
--timeout 300 \
--memory-size 1024


aws cloudformation create-stack \
--stack-name bi-app-aws-resources-devops-master \
--template-body file://bi-aws-resources.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=devops,\
ParameterKey=LambdaFunctionName,ParameterValue=s3-copy2archive-lambda \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

aws cloudformation update-stack \
--stack-name bi-app-aws-resources-devops-master \
--template-body file://bi-aws-resources.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=devops,\
ParameterKey=LambdaFunctionName,ParameterValue=s3-copy2archive-lambda \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1


### Note: After the stack is created,In the console, go to the lambda function(bi-app-aws-resources-devo-FunctionTopicSubscriptio-XXXXXXXXX) got created and configure the event source of the lambda to the sns topic(bi-devops-sns-file-uploaded) got created.





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

### Note : Clone the aip-aws-devops code commit repository (master branch ), Upload the lambda_handler.zip  from the "aip-aws-devops/cfn-templates/aip-bi/lambda/archive-s3/" to the bucket "aip-devops-us-east-1-661072482170/lambda/s3Archival/"

aws cloudformation create-stack \
--stack-name bi-app-aws-resources-dev-master \
--template-body file://bi-aws-resources.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=dev,\
ParameterKey=LambdaFunctionName,ParameterValue=s3-copy2archive-lambda \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

aws cloudformation update-stack \
--stack-name bi-app-aws-resources-dev-master \
--template-body file://bi-aws-resources.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=dev,\
ParameterKey=LambdaFunctionName,ParameterValue=s3-copy2archive-lambda \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1


### Note: After the stack is created,In the console, go to the lambda function(bi-app-aws-resources-dev-FunctionTopicSubscriptio-XXXXXXXXX) got created and configure the event source of the lambda to the sns topic(bi-dev-sns-file-uploaded) got created.


### Test
## -- Create Abbott AWS: Test environment --
aws cloudformation create-stack \
--stack-name bi-app-test-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-test-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update Abbott AWS: Test environment --
aws cloudformation update-stack \
--stack-name bi-app-test-master \
--template-body file://bi-master.cfn.json \
--parameters file://bi-test-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM
--region us-east-1


## AWS resources
aws cloudformation create-stack \
--stack-name bi-app-aws-resources-test-master \
--template-body file://bi-aws-resources.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=test \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

aws cloudformation update-stack \
--stack-name bi-app-aws-resources-test-master \
--template-body file://bi-aws-resources.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=test \
--capabilities CAPABILITY_IAM --disable-rollback \
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
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

aws cloudformation update-stack \
--stack-name bi-app-aws-resources-qa-master \
--template-body file://bi-aws-resources.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=qa \
--capabilities CAPABILITY_IAM --disable-rollback \
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
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

aws cloudformation update-stack \
--stack-name bi-app-aws-resources-prod-master \
--template-body file://bi-aws-resources.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=prod \
--capabilities CAPABILITY_IAM --disable-rollback \
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
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

aws cloudformation update-stack \
--stack-name bi-app-aws-resources-prod2-master \
--template-body file://bi-aws-resources.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=prod2 \
--capabilities CAPABILITY_IAM --disable-rollback \
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
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

aws cloudformation update-stack \
--stack-name bi-app-aws-resources-beta-master \
--template-body file://bi-aws-resources.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=beta \
--capabilities CAPABILITY_IAM --disable-rollback \
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
--capabilities CAPABILITY_IAM --disable-rollback \
--region eu-west-1

aws cloudformation update-stack \
--stack-name bi-app-aws-resources-prod-master \
--template-body file://bi-aws-resources.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=prod \
--capabilities CAPABILITY_IAM --disable-rollback \
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
--capabilities CAPABILITY_IAM --disable-rollback \
--region ap-northeast-1


aws cloudformation update-stack \
--stack-name bi-app-aws-resources-prod-master \
--template-body file://bi-aws-resources.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=prod \
--capabilities CAPABILITY_IAM --disable-rollback \
--region ap-northeast-1

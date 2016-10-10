### Readme.md



### --------------------------
###    -- DNS Route 53 -- 
###


## -- Create Sandbox AWS: Dev environment --
aws cloudformation create-stack \
--stack-name aip-dns-private \
--template-body file://aip-dns-private.cfn.json \
--capabilities CAPABILITY_IAM --disable-rollback --region us-east-1 --profile sandbox

## -- Create Sandbox AWS: Dev environment --
aws cloudformation create-stack \
--stack-name aip-dns-public \
--template-body file://aip-dns-public.cfn.json \
--capabilities CAPABILITY_IAM --disable-rollback --region us-east-1 --profile sandbox
#### --------------------------




#########################################################################
# ------ N. Virginia US-East-1 Region ------
## -- S3 Archive bucket aip-s3-archive-{region}-{accountnumber}
#########################################################################


## -- Create Archival S3 Bucket with lifecyclepolicy --
aws cloudformation create-stack \
--stack-name aip-archival-s3-bucket \
--template-body file://aip-s3archive-lifecycle.cfn.json \
--parameters ParameterKey=RetentionPeriod,ParameterValue=5  \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1




########################################
# ------ Ireland EU-west-1 Region ------
########################################



### Elastic Beanstalk App Environments


## -- Create Abbott AWS: Prod environment --
aws cloudformation create-stack \
--stack-name aip-eb-apps-master \
--template-body file://aip-eb-apps.cfn.json \
--capabilities CAPABILITY_IAM --disable-rollback --region eu-west-1 

## -- Create Archival S3 Bucket with lifecyclepolicy --
aws cloudformation create-stack \
--stack-name aip-archival-s3-bucket \
--template-body file://aip-s3archive-lifecycle.cfn.json \
--parameters ParameterKey=RetentionPeriod,ParameterValue=15  \
--capabilities CAPABILITY_IAM --disable-rollback \
--region eu-west-1




########################################
# ---- Tokyo AP-NorthEast-1 Region -----
########################################


### Elastic Beanstalk App Environments

## -- Create Abbott AWS: Prod environment --
aws cloudformation create-stack \
--stack-name aip-eb-apps-master \
--template-body file://aip-eb-apps.cfn.json \
--capabilities CAPABILITY_IAM --disable-rollback --region ap-northeast-1 

## -- Create Archival S3 Bucket with lifecyclepolicy --
aws cloudformation create-stack \
--stack-name aip-archival-s3-bucket \
--template-body file://aip-s3archive-lifecycle.cfn.json \
--parameters ParameterKey=RetentionPeriod,ParameterValue=15  \
--capabilities CAPABILITY_IAM --disable-rollback \
--region ap-northeast-1


########################################
# ---- aip-S3bucket-across region -----
## -- Static Website, 
## -- DynamoDDB - Glacier backup data 
########################################

## Environment specific stacks --

## Devops environment --
aws cloudformation create-stack \
--stack-name aip-devops-s3-bucket-us-east-1 \
--template-body file://aip-S3bucket-Lifecycle.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=devops \
ParameterKey=RetentionPeriod,ParameterValue=15  \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## Dev environment --
aws cloudformation create-stack \
--stack-name aip-devops-s3-bucket-us-east-1 \
--template-body file://aip-S3bucket-Lifecycle.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=dev \
ParameterKey=RetentionPeriod,ParameterValue=15  \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## Test environment --
aws cloudformation create-stack \
--stack-name aip-devops-s3-bucket-us-east-1 \
--template-body file://aip-S3bucket-Lifecycle.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=test \
ParameterKey=RetentionPeriod,ParameterValue=15  \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## QA environment --
aws cloudformation create-stack \
--stack-name aip-devops-s3-bucket-us-east-1 \
--template-body file://aip-S3bucket-Lifecycle.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=qa \
ParameterKey=RetentionPeriod,ParameterValue=15  \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## Prod environment --
aws cloudformation create-stack \
--stack-name aip-devops-s3-bucket-us-east-1 \
--template-body file://aip-S3bucket-Lifecycle.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=prod \
ParameterKey=RetentionPeriod,ParameterValue=15  \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

### Ireland Prod environment 
aws cloudformation create-stack \
--stack-name aip-devops-s3-bucket-us-east-1 \
--template-body file://aip-S3bucket-Lifecycle.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=prod \
ParameterKey=RetentionPeriod,ParameterValue=15  \
--capabilities CAPABILITY_IAM --disable-rollback \
--region eu-west-1

### Tokyo Prod environment 
aws cloudformation create-stack \
--stack-name aip-devops-s3-bucket-us-east-1 \
--template-body file://aip-S3bucket-Lifecycle.cfn.json \
--parameters ParameterKey=Environment,ParameterValue=prod \
ParameterKey=RetentionPeriod,ParameterValue=15  \
--capabilities CAPABILITY_IAM --disable-rollback \
--region ap-northeast-1

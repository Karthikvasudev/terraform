#Readme.md

#Common log bucket for cloudTrail-logs,AWSconfig-logs, CloudFront-logs form all  regions



### Abbott AWS --Common--Log--Bucket ""
##
## -- Create Abbott AWS: Region us-east-1 --
aws cloudformation create-stack \
--stack-name common-logs-archival --template-body file://common-logs-archival.cfn.json \
--parameters file://common-logs-archival-params.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

aws cloudformation update-stack \
--stack-name common-logs-archival --template-body file://common-logs-archival.cfn.json \
--parameters file://common-logs-archival-params.json \
--capabilities CAPABILITY_IAM \
--region us-east-1


## -- Create Abbott AWS: Region eu-west-1 --
aws cloudformation create-stack \
--stack-name common-logs-archival --template-body file://common-logs-archival.cfn.json \
--parameters file://common-logs-archival-params.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region eu-west-1

aws cloudformation update-stack \
--stack-name common-logs-archival --template-body file://common-logs-archival.cfn.json \
--parameters file://common-logs-archival-params.json \
--capabilities CAPABILITY_IAM \
--region eu-west-1

## -- Create Abbott AWS: Region ap-northeast-1 --
aws cloudformation create-stack \
--stack-name common-logs-archival --template-body file://common-logs-archival.cfn.json \
--parameters file://common-logs-archival-params.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region ap-northeast-1

aws cloudformation update-stack \
--stack-name common-logs-archival --template-body file://common-logs-archival.cfn.json \
--parameters file://common-logs-archival-params.json \
--capabilities CAPABILITY_IAM \
--region ap-northeast-1

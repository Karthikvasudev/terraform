#Readme.md

#Common log bucket for cloudTrail-logs,AWSconfig-logs, CloudFront-logs form all  regions



### Abbott AWS --Common--Log--Bucket ""
##
### Devops
## -- Create Abbott AWS: Dev environment --
aws cloudformation create-stack \
--stack-name common-logs-archival --template-body file://common-logs-archival.cfn.json \
--parameters file://common-logs-archival-devops-params.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

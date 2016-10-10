#Readme.md

AWS CloudFormation Stack commands for Elasticsearch Domain

####

Elasticsearch Domain

-- Create Abbott AWS: DevOps environment --

aws cloudformation create-stack \ --stack-name Elasticsearch-devops-us-east-1 \ --template-body file://Elasticsearch.cfn.json \ --parameters file://Elasticsearch-devops-launch-params-us-east-1.json \ --capabilities CAPABILITY_IAM --disable-rollback \ --region us-east-1


-- update Abbott AWS: Devops environment --

aws cloudformation update-stack \ --stack-name Elasticsearch-devops-us-east-1 \ --template-body file://Elasticsearch.cfn.json \ --parameters file://Elasticsearch-devops-launch-params-us-east-1.json \ --capabilities CAPABILITY_IAM \ --region us-east-1

####

R53 CName for Elasticsearch

-- Create Abbott AWS: DevOps environment --

aws cloudformation create-stack \ --stack-name Elasticsearch--R53-CName-devops \ --template-body file://Elasticsearch-R53.cfn.json \ --parameters file://Elasticsearch-R53-devops-launch-params-us-east-1.json \ --capabilities CAPABILITY_IAM --disable-rollback \ --region us-east-1


-- update Abbott AWS: Devops environment --

aws cloudformation update-stack \ --stack-name Elasticsearch--R53-CName-devops \ --template-body file://Elasticsearch-R53.cfn.json \ --parameters file://Elasticsearch-R53-devops-launch-params-us-east-1.json \ --capabilities CAPABILITY_IAM \ --region us-east-1
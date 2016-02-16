#Readme.md

AWS CloudFormation Stack commands for S3 web hosting

##

S3 Static Web Hosting

-- Create Abbott AWS: DevOps environment --

aws cloudformation create-stack \ --stack-name aip-bi-static-devops-S3 \ --template-body file://aip-bi-S3-staticassets.cfn.json \ --parameters file://aip-bi-S3-staticassets-devops-launch-params-us-east-1.json \ --capabilities CAPABILITY_IAM --disable-rollback \ --region us-east-1


-- update Abbott AWS: Devops environment --

aws cloudformation update-stack \ --stack-name aip-bi-static-devops-S3 \ --template-body file://aip-bi-S3-staticassets.cfn.json \ --parameters file://aip-bi-S3-staticassets-devops-launch-params-us-east-1.json \ --capabilities CAPABILITY_IAM \ --region us-east-1

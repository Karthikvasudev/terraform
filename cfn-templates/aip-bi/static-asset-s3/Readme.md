#Readme.md

AWS CloudFormation Stack commands for S3 web hosting

##

S3 Static Web Hosting

-- Create Abbott AWS: DevOps environment --

aws cloudformation create-stack \
 --stack-name aip-bi-static-devops-S3 \
 --template-body file://aip-bi-S3-staticassets.cfn.json \
 --parameters file://aip-bi-S3-staticassets-devops-launch-params-us-east-1.json \
 --capabilities CAPABILITY_IAM --disable-rollback \
 --region us-east-1


-- update Abbott AWS: Devops environment --

aws cloudformation update-stack \
 --stack-name aip-bi-static-devops-S3 \
 --template-body file://aip-bi-S3-staticassets.cfn.json \
 --parameters file://aip-bi-S3-staticassets-devops-launch-params-us-east-1.json \
 --capabilities CAPABILITY_IAM \
 --region us-east-1


---

-- Create Abbott AWS: Dev environment --

aws cloudformation create-stack \
 --stack-name aip-bi-static-dev-S3 \
 --template-body file://aip-bi-S3-staticassets.cfn.json \
 --parameters file://aip-bi-S3-staticassets-dev-launch-params-us-east-1.json \
 --capabilities CAPABILITY_IAM --disable-rollback \
 --region us-east-1


-- update Abbott AWS: Dev environment --

aws cloudformation update-stack \
 --stack-name aip-bi-static-dev-S3 \
 --template-body file://aip-bi-S3-staticassets.cfn.json \
 --parameters file://aip-bi-S3-staticassets-dev-launch-params-us-east-1.json \
 --capabilities CAPABILITY_IAM \
 --region us-east-1


---

-- Create Abbott AWS: Test environment --

aws cloudformation create-stack \
 --stack-name aip-bi-static-test-S3 \
 --template-body file://aip-bi-S3-staticassets.cfn.json \
 --parameters file://aip-bi-S3-staticassets-test-launch-params-us-east-1.json \
 --capabilities CAPABILITY_IAM --disable-rollback \
 --region us-east-1


-- update Abbott AWS: Test environment --

aws cloudformation update-stack \
 --stack-name aip-bi-static-test-S3 \
 --template-body file://aip-bi-S3-staticassets.cfn.json \
 --parameters file://aip-bi-S3-staticassets-test-launch-params-us-east-1.json \
 --capabilities CAPABILITY_IAM \
 --region us-east-1


---

-- Create Abbott AWS: QA environment --

aws cloudformation create-stack \
 --stack-name aip-bi-static-qa-S3 \
 --template-body file://aip-bi-S3-staticassets.cfn.json \
 --parameters file://aip-bi-S3-staticassets-qa-launch-params-us-east-1.json \
 --capabilities CAPABILITY_IAM --disable-rollback \
 --region us-east-1

-- update QA environment --

aws cloudformation update-stack \
 --stack-name aip-bi-static-qa-S3 \
 --template-body file://aip-bi-S3-staticassets.cfn.json \
 --parameters file://aip-bi-S3-staticassets-qa-launch-params-us-east-1.json \
 --capabilities CAPABILITY_IAM \
 --region us-east-1


---

-- Create Abbott AWS: Prod environment --

aws cloudformation create-stack \
 --stack-name aip-bi-static-prod-S3 \
 --template-body file://aip-bi-S3-staticassets.cfn.json \
 --parameters file://aip-bi-S3-staticassets-prod-launch-params-us-east-1.json \
 --capabilities CAPABILITY_IAM --disable-rollback \
 --region us-east-1

-- update Prod environment --

aws cloudformation update-stack \
 --stack-name aip-bi-static-prod-S3 \
 --template-body file://aip-bi-S3-staticassets.cfn.json \
 --parameters file://aip-bi-S3-staticassets-prod-launch-params-us-east-1.json \
 --capabilities CAPABILITY_IAM \
 --region us-east-1


---

-- Create Abbott AWS: Prod2 environment --

aws cloudformation create-stack \
 --stack-name aip-bi-static-prod2-S3 \
 --template-body file://aip-bi-S3-staticassets.cfn.json \
 --parameters file://aip-bi-S3-staticassets-prod2-launch-params-us-east-1.json \
 --capabilities CAPABILITY_IAM --disable-rollback \
 --region us-east-1

-- update Prod2 environment --

aws cloudformation update-stack \
 --stack-name aip-bi-static-prod2-S3 \
 --template-body file://aip-bi-S3-staticassets.cfn.json \
 --parameters file://aip-bi-S3-staticassets-prod2-launch-params-us-east-1.json \
 --capabilities CAPABILITY_IAM \
 --region us-east-1

---

-- Create Abbott AWS: Beta environment --

aws cloudformation create-stack \
 --stack-name aip-bi-static-beta-S3 \
 --template-body file://aip-bi-S3-staticassets.cfn.json \
 --parameters file://aip-bi-S3-staticassets-beta-launch-params-us-east-1.json \
 --capabilities CAPABILITY_IAM --disable-rollback \
 --region us-east-1

-- update Beta environment --

aws cloudformation update-stack \
 --stack-name aip-bi-static-beta-S3 \
 --template-body file://aip-bi-S3-staticassets.cfn.json \
 --parameters file://aip-bi-S3-staticassets-beta-launch-params-us-east-1.json \
 --capabilities CAPABILITY_IAM \
 --region us-east-1




########################################
# ------ Ireland EU-west-1 Region ------
########################################

-- Create Abbott AWS: Prod environment --

aws cloudformation create-stack \
 --stack-name aip-bi-static-prod-S3 \
 --template-body file://aip-bi-S3-staticassets.cfn.json \
 --parameters file://aip-bi-S3-staticassets-prod-launch-params-eu-west-1.json \
 --capabilities CAPABILITY_IAM --disable-rollback \
 --region eu-west-1

-- update Prod environment --

aws cloudformation update-stack \
 --stack-name aip-bi-static-prod-S3 \
 --template-body file://aip-bi-S3-staticassets.cfn.json \
 --parameters file://aip-bi-S3-staticassets-prod-launch-params-eu-west-1.json \
 --capabilities CAPABILITY_IAM \
 --region eu-west-1




#######################################
# ------ Tokyo EU-west-1 Region -------
#######################################

-- Create Abbott AWS: Prod environment --

aws cloudformation create-stack \
 --stack-name aip-bi-static-prod-S3 \
 --template-body file://aip-bi-S3-staticassets.cfn.json \
 --parameters file://aip-bi-S3-staticassets-prod-launch-params-ap-northeast-1.json \
 --capabilities CAPABILITY_IAM --disable-rollback \
 --region ap-northeast-1

-- update Prod environment --

aws cloudformation update-stack \
 --stack-name aip-bi-static-prod-S3 \
 --template-body file://aip-bi-S3-staticassets.cfn.json \
 --parameters file://aip-bi-S3-staticassets-prod-launch-params-ap-northeast-1.json \
 --capabilities CAPABILITY_IAM \
 --region ap-northeast-1


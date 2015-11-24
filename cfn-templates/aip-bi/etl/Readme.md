#Readme.md

run AWS CloudFormation Stack commands for BI Environments
Copy/Paste into bash shell window
Note: include --profile sandbox when testing only. Included for safety reasons



### Abbott AWS -- Beanstalk App -- ETL Services ""
##
### Dev
## -- Create Abbott AWS: Dev environment --
aws cloudformation create-stack \
--stack-name bi-etl-dev-master --template-body file://bi-etl-master.cfn.json \
--parameters file://bi-etl-dev-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback


## -- Update Abbott AWS: Dev environment --
aws cloudformation update-stack  \
--stack-name bi-etl-dev-master --template-body file://bi-etl-master.cfn.json \
--parameters file://bi-etl-dev-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM 


aws cloudformation create-stack \
--stack-name bi-etl-dev-master --template-body file://bi-etl-master.cfn.json \
--parameters file://bi-etl-dev-launch-params-us-east-1-Sandbox.json \
--capabilities CAPABILITY_IAM --disable-rollback


aws cloudformation update-stack \
--stack-name bi-etl-dev-master --template-body file://bi-etl-master.cfn.json \
--parameters file://bi-etl-dev-launch-params-us-east-1-Sandbox.json \
--capabilities CAPABILITY_IAM 



## -- Create Abbott AWS: Test environment --
aws cloudformation create-stack \
--stack-name bi-etl-test-master --template-body file://bi-etl-master.cfn.json \
--parameters file://bi-etl-test-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback


## -- Update Abbott AWS: Test environment --
aws cloudformation update-stack \
--stack-name bi-etl-test-master --template-body file://bi-etl-master.cfn.json \
--parameters file://bi-etl-test-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM 


## -- Create Abbott AWS: QA environment --
aws cloudformation create-stack \
--stack-name bi-etl-qa-master --template-body file://bi-etl-master.cfn.json \
--parameters file://bi-etl-qa-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback


## -- Update Abbott AWS: QA environment --
aws cloudformation update-stack \
--stack-name bi-etl-qa-master --template-body file://bi-etl-master.cfn.json \
--parameters file://bi-etl-qa-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM 



## -- Create Abbott AWS: Prod environment --
aws cloudformation create-stack \
--stack-name bi-etl-prod-master --template-body file://bi-etl-master.cfn.json \
--parameters file://bi-etl-prod-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback


## -- Update Abbott AWS: Prod environment --
aws cloudformation update-stack \
--stack-name bi-etl-prod-master --template-body file://bi-etl-master.cfn.json \
--parameters file://bi-etl-prod-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM 




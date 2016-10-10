#Readme.md

AWS CloudFormation Stack commands for Redshift Environment
Copy/Paste into bash shell window



### Abbott AWS -- Redshift Master Template -- 


### DevOps
## -- Create Abbott AWS: DevOps environment --
aws cloudformation create-stack \
--stack-name bi-devops-redshift-master \
--template-body file://bi-redshift.cfn.json \
--parameters file://bi-redshift-devops-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update Abbott AWS: DevOps environment --
aws cloudformation update-stack \
--stack-name bi-devops-redshift-master \
--template-body file://bi-redshift.cfn.json \
--parameters file://bi-redshift-devops-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1


### Dev
## -- Create Abbott AWS: Dev environment --
aws cloudformation create-stack \
--stack-name bi-dev-redshift-master \
--template-body file://bi-redshift.cfn.json \
--parameters file://bi-redshift-dev-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update Abbott AWS: Dev environment --
aws cloudformation update-stack \
--stack-name bi-dev-redshift-master \
--template-body file://bi-redshift.cfn.json \
--parameters file://bi-redshift-dev-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1

### Test
## -- Create Abbott AWS: Test environment --
aws cloudformation create-stack \
--stack-name bi-test-redshift-master \
--template-body file://bi-redshift.cfn.json \
--parameters file://bi-redshift-test-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update Abbott AWS: Test environment --
aws cloudformation update-stack \
--stack-name bi-test-redshift-master \
--template-body file://bi-redshift.cfn.json \
--parameters file://bi-redshift-test-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1

### QA
## -- Create Abbott AWS: QA environment --
aws cloudformation create-stack \
--stack-name bi-qa-redshift-master \
--template-body file://bi-redshift.cfn.json \
--parameters file://bi-redshift-qa-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update Abbott AWS: QA environment --
aws cloudformation update-stack \
--stack-name bi-qa-redshift-master \
--template-body file://bi-redshift.cfn.json \
--parameters file://bi-redshift-qa-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1

### Prod
## -- Create Abbott AWS: Prod environment --
aws cloudformation create-stack \
--stack-name bi-prod-redshift-master \
--template-body file://bi-redshift.cfn.json \
--parameters file://bi-redshift-prod-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update Abbott AWS: Prod environment --
aws cloudformation update-stack \
--stack-name bi-prod-redshift-master \
--template-body file://bi-redshift.cfn.json \
--parameters file://bi-redshift-prod-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1


### Prod2
## -- Create Abbott AWS: prod2 environment --
aws cloudformation create-stack \
--stack-name bi-prod2-redshift-master \
--template-body file://bi-redshift.cfn.json \
--parameters file://bi-redshift-prod2-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update Abbott AWS: prod2 environment --
aws cloudformation update-stack \
--stack-name bi-prod2-redshift-master \
--template-body file://bi-redshift.cfn.json \
--parameters file://bi-redshift-prod2-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1


### Beta
## -- Create Abbott AWS: Beta environment --
aws cloudformation create-stack \
--stack-name bi-beta-redshift-master2 \
--template-body file://bi-redshift.cfn.json \
--parameters file://bi-redshift-beta-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update Abbott AWS: Beta environment --
aws cloudformation update-stack \
--stack-name bi-beta-redshift-master \
--template-body file://bi-redshift.cfn.json \
--parameters file://bi-redshift-beta-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1



########################################
# ------ Ireland EU-west-1 Region ------
########################################


### Prod
## -- Create Abbott AWS: Prod environment --
aws cloudformation create-stack \
--stack-name aip-redshift-prod-master \
--template-body file://bi-redshift.cfn.json \
--parameters file://bi-redshift-prod-launch-params-eu-west-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region eu-west-1

## -- Update Abbott AWS: Prod environment --
aws cloudformation update-stack \
--stack-name aip-redshift-prod-master \
--template-body file://bi-redshift.cfn.json \
--parameters file://bi-redshift-prod-launch-params-eu-west-1.json \
--capabilities CAPABILITY_IAM \
--region eu-west-1




########################################
# ---- Tokyo AP-NorthEast-1 Region -----
########################################

### Prod
## -- Create Abbott AWS: Prod environment --
aws cloudformation create-stack \
--stack-name aip-redshift-prod-master \
--template-body file://bi-redshift.cfn.json \
--parameters file://bi-redshift-prod-launch-params-ap-northeast-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region ap-northeast-1

## -- Update Abbott AWS: Prod environment --
aws cloudformation update-stack \
--stack-name aip-redshift-prod-master \
--template-body file://bi-redshift.cfn.json \
--parameters file://bi-redshift-prod-launch-params-ap-northeast-1.json \
--capabilities CAPABILITY_IAM \
--region ap-northeast-1

#Readme.md

AWS CloudFormation Stack commands for Redis Cluster
##

# Devops

## -- Create Abbott AWS: DevOps environment --
aws cloudformation create-stack \
--stack-name aip-redis-devops-master \
--template-body file://aip-redis-cluster.cfn.json \
--parameters file://aip-redis-cluster-devops-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- update Abbott AWS: Devops environment --
aws cloudformation update-stack \
--stack-name aip-redis-devops-master \
--template-body file://aip-redis-cluster.cfn.json \
--parameters file://aip-redis-cluster-devops-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1



# Dev

## -- Create Abbott AWS: Dev environment --
aws cloudformation create-stack \
--stack-name aip-redis-dev-master \
--template-body file://aip-redis-cluster.cfn.json \
--parameters file://aip-redis-cluster-dev-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- update Abbott AWS: Dev environment --
aws cloudformation update-stack \
--stack-name aip-redis-dev-master \
--template-body file://aip-redis-cluster.cfn.json \
--parameters file://aip-redis-cluster-dev-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1


# Test

## -- Create Abbott AWS: Test environment --
aws cloudformation create-stack \
--stack-name aip-redis-test-master \
--template-body file://aip-redis-cluster.cfn.json \
--parameters file://aip-redis-cluster-test-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- update Abbott AWS: Test environment --
aws cloudformation update-stack \
--stack-name aip-redis-test-master \
--template-body file://aip-redis-cluster.cfn.json \
--parameters file://aip-redis-cluster-test-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1



# QA

## -- Create Abbott AWS: QA environment --
aws cloudformation create-stack \
--stack-name aip-redis-qa-master \
--template-body file://aip-redis-cluster.cfn.json \
--parameters file://aip-redis-cluster-qa-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- update Abbott AWS: QA environment --
aws cloudformation update-stack \
--stack-name aip-redis-qa-master \
--template-body file://aip-redis-cluster.cfn.json \
--parameters file://aip-redis-cluster-qa-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1



# Beta

## -- Create Abbott AWS: Beta environment --
aws cloudformation create-stack \
--stack-name aip-redis-beta-master \
--template-body file://aip-redis-cluster.cfn.json \
--parameters file://aip-redis-cluster-beta-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- update Abbott AWS: Beta environment --
aws cloudformation update-stack \
--stack-name aip-redis-beta-master \
--template-body file://aip-redis-cluster.cfn.json \
--parameters file://aip-redis-cluster-beta-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1

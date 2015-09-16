Readme.md

run AWS CloudFormation Stack commands for BI Environments
Copy/Paste into bash shell window
Note: include --profile test when testing only. Included for safety reasons

# BI Administration VPC -- Use update-stack thereafter create-stack
#aws cloudformation create-stack \
--stack-name aip-bi-admin-vpc \
--template-body file://aip-bi-admin-vpc.cfn.json \
--parameters file://aip-bi-admin-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback --profile test

#aws cloudformation update-stack \
--stack-name aip-bi-admin-vpc \
--template-body file://aip-bi-admin-vpc.cfn.json \
--parameters file://aip-bi-admin-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --profile test

# VPN connection for BI Administration VPC
#aws cloudformation update-stack \
--stack-name aip-bi-admin-vpc-vpn \
--template-body file://aip-bi-admin-vpc-vpn.cfn.json \
--parameters file://aip-bi-launch-params-vpc-vpn-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback --profile test

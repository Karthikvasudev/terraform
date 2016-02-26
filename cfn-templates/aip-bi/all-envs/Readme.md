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







#############################################
# ------ Frankfurt EU-Central-1 Region ------
#############################################






########################################
# ------ Ireland EU-west-1 Region ------
########################################



### Elastic Beanstalk App Environments

Testing / Debugging
## -- Create Abbott AWS: Prod environment --
aws cloudformation create-stack \
--stack-name aip-eb-apps-master \
--template-body file://aip-eb-apps.cfn.json \
--capabilities CAPABILITY_IAM --disable-rollback --region eu-west-1 





########################################
# ---- Tokyo AP-NorthEast-1 Region -----
########################################


### Elastic Beanstalk App Environments

Testing / Debugging
## -- Create Abbott AWS: Prod environment --
aws cloudformation create-stack \
--stack-name aip-eb-apps-master \
--template-body file://aip-eb-apps.cfn.json \
--capabilities CAPABILITY_IAM --disable-rollback --region ap-northeast-1 




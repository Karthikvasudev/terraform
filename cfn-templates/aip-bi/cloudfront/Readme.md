#Readme.md

# AWS CloudFormation Stack commands for CloudFront

# Devops - Create
aws cloudformation create-stack \
--stack-name aip-cloudfront-devops-master \
--template-body file://aip-cloudfront.cfn.json \
--parameters file://aip-cloudfront-devops-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update
aws cloudformation update-stack \
--stack-name aip-cloudfront-devops-master \
--template-body file://aip-cloudfront.cfn.json \
--parameters file://aip-cloudfront-devops-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1

## - Run CDN Fixup script after any create-stack or update-stack (avoids manual clicks, etc.)
##   Requires python 3 and AWS Boto3
python cdn-fix.py --Id XXX     #"Distribution Id" from cloudfront console page, optional --verbose flag

## - Run R53 Env-Region to CDN script
update-hostedzone.sh -e devops -z Z1YQCIKJK8P7ZS -r us-1

---

# Dev - Create 
aws cloudformation create-stack \
--stack-name aip-cloudfront-dev-master \
--template-body file://aip-cloudfront.cfn.json \
--parameters file://aip-cloudfront-dev-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update
aws cloudformation update-stack \
--stack-name aip-cloudfront-dev-master \
--template-body file://aip-cloudfront.cfn.json \
--parameters file://aip-cloudfront-dev-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1

## - Run CDN Fixup script after any create-stack or update-stack (avoids manual clicks, etc.)
##   Requires python 3 and AWS Boto3
python cdn-fix.py --Id XXX     #"Distribution Id" from cloudfront console page

## - Run R53 Env-Region to CDN script
update-hostedzone.sh -e dev -z Z1YQCIKJK8P7ZS -r us-1

---

# Test - Create 
aws cloudformation create-stack \
--stack-name aip-cloudfront-test-master \
--template-body file://aip-cloudfront.cfn.json \
--parameters file://aip-cloudfront-test-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update
aws cloudformation update-stack \
--stack-name aip-cloudfront-test-master \
--template-body file://aip-cloudfront.cfn.json \
--parameters file://aip-cloudfront-test-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1

## - Run CDN Fixup script after any create-stack or update-stack (avoids manual clicks, etc.)
##   Requires python 3 and AWS Boto3
python cdn-fix.py --Id XXX     #"Distribution Id" from cloudfront console page

## - Run R53 Env-Region to CDN script
update-hostedzone.sh -e test -z Z1YQCIKJK8P7ZS -r us-1


---

# QA - Create 
aws cloudformation create-stack \
--stack-name aip-cloudfront-qa-master \
--template-body file://aip-cloudfront.cfn.json \
--parameters file://aip-cloudfront-qa-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update
aws cloudformation update-stack \
--stack-name aip-cloudfront-qa-master \
--template-body file://aip-cloudfront.cfn.json \
--parameters file://aip-cloudfront-qa-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1

## - Run CDN Fixup script after any create-stack or update-stack (avoids manual clicks, etc.)
##   Requires python 3 and AWS Boto3
python cdn-fix.py --Id XXX     #"Distribution Id" from cloudfront console page

## - Run R53 Env-Region to CDN script
update-hostedzone.sh -e qa -z Z1YQCIKJK8P7ZS -r us-1


---

# Prod - Create 
aws cloudformation create-stack \
--stack-name aip-cloudfront-prod-master \
--template-body file://aip-cloudfront.cfn.json \
--parameters file://aip-cloudfront-prod-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update
aws cloudformation update-stack \
--stack-name aip-cloudfront-prod-master \
--template-body file://aip-cloudfront.cfn.json \
--parameters file://aip-cloudfront-prod-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1

## - Run CDN Fixup script after any create-stack or update-stack (avoids manual clicks, etc.)
##   Requires python 3 and AWS Boto3
python cdn-fix.py --Id XXX     #"Distribution Id" from cloudfront console page

## - Run R53 Env-Region to CDN script
update-hostedzone.sh -e prod -z Z1YQCIKJK8P7ZS -r us-1


---

# Prod2 - Create 
aws cloudformation create-stack \
--stack-name aip-cloudfront-prod2-master \
--template-body file://aip-cloudfront.cfn.json \
--parameters file://aip-cloudfront-prod2-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update
aws cloudformation update-stack \
--stack-name aip-cloudfront-prod2-master \
--template-body file://aip-cloudfront.cfn.json \
--parameters file://aip-cloudfront-prod2-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1

## - Run CDN Fixup script after any create-stack or update-stack (avoids manual clicks, etc.)
##   Requires python 3 and AWS Boto3
python cdn-fix.py --Id XXX     #"Distribution Id" from cloudfront console page

## - Run R53 Env-Region to CDN script
update-hostedzone.sh -e prod2 -z Z1YQCIKJK8P7ZS -r us-1


---

# Beta - Create 
aws cloudformation create-stack \
--stack-name aip-cloudfront-beta-master \
--template-body file://aip-cloudfront.cfn.json \
--parameters file://aip-cloudfront-beta-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- Update
aws cloudformation update-stack \
--stack-name aip-cloudfront-beta-master \
--template-body file://aip-cloudfront.cfn.json \
--parameters file://aip-cloudfront-beta-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1

## - Run CDN Fixup script after any create-stack or update-stack (avoids manual clicks, etc.)
##   Requires python 3 and AWS Boto3
python cdn-fix.py --Id XXX     #"Distribution Id" from cloudfront console page

## - Run R53 Env-Region to CDN script
update-hostedzone.sh -e beta -z Z1YQCIKJK8P7ZS -r us-1



########################################
# ------ Ireland EU-west-1 Region ------
########################################

# Prod - Create 
aws cloudformation create-stack \
--stack-name aip-cloudfront-prod-master \
--template-body file://aip-cloudfront.cfn.json \
--parameters file://aip-cloudfront-prod-launch-params-eu-west-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region eu-west-1

## -- Update
aws cloudformation update-stack \
--stack-name aip-cloudfront-prod-master \
--template-body file://aip-cloudfront.cfn.json \
--parameters file://aip-cloudfront-prod-launch-params-eu-west-1.json \
--capabilities CAPABILITY_IAM \
--region eu-west-1

## - Run CDN Fixup script after any create-stack or update-stack (avoids manual clicks, etc.)
##   Requires python 3 and AWS Boto3
python cdn-fix.py --Id XXX     #"Distribution Id" from cloudfront console page

## - Run R53 Env-Region to CDN script
update-hostedzone.sh -e prod -z Z1YQCIKJK8P7ZS -r eu-1



#######################################
# ------ Tokyo EU-west-1 Region -------
#######################################

# Prod - Create 
aws cloudformation create-stack \
--stack-name aip-cloudfront-prod-master \
--template-body file://aip-cloudfront.cfn.json \
--parameters file://aip-cloudfront-prod-launch-params-ap-northeast-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region ap-northeast-1

## -- Update
aws cloudformation update-stack \
--stack-name aip-cloudfront-prod-master \
--template-body file://aip-cloudfront.cfn.json \
--parameters file://aip-cloudfront-prod-launch-params-ap-northeast-1 \
--capabilities CAPABILITY_IAM \
--region ap-northeast-1

## - Run CDN Fixup script after any create-stack or update-stack (avoids manual clicks, etc.)
##   Requires python 3 and AWS Boto3
python cdn-fix.py --Id XXX     #"Distribution Id" from cloudfront console page

## - Run R53 Env-Region to CDN script
update-hostedzone.sh -e prod -z Z1YQCIKJK8P7ZS -r ap-1







# ---
# IAM Certificate Store upload command

$ aws iam upload-server-certificate --server-certificate-name aliniqbis.com --certificate-body file://aliniqbis.com.cer --private-key file://aliniqbis.com.key --certificate-chain file://ca-chain.pem --path /cloudfront/production/

# List IAM Certificate Store 
$ aws iam list-server-certificates
{
    "ServerCertificateMetadataList": [
        {
            "ServerCertificateId": "ASCAI6DIHMLCEDXKCUWBS",
            "ServerCertificateName": "aliniqbis.com",
            "Expiration": "2016-12-20T23:59:59Z",
            "Path": "/cloudfront/production/",
            "Arn": "arn:aws:iam::661072482170:server-certificate/cloudfront/production/aliniqbis.com",
            "UploadDate": "2016-01-28T16:38:01Z"
        }
    ]
}
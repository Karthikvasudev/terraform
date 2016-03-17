#Readme.md

# AWS CloudFormation Stack commands for CloudFront

# Devops - create
aws cloudformation create-stack \
--stack-name aip-cloudfront-devops-master \
--template-body file://aip-cloudfront.cfn.json \
--parameters file://aip-cloudfront-devops-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- update
aws cloudformation update-stack \
--stack-name aip-cloudfront-devops-master \
--template-body file://aip-cloudfront.cfn.json \
--parameters file://aip-cloudfront-devops-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1

## - Run CDN Fixup script after any create-stack or update-stack (avoids manual clicks, etc.)
##   Requires python 3 and AWS Boto3
python cdn-fix.py --Id XXX     #"Distribution Id" from cloudfront console page

## - Run R53 Env-Region to CDN script
update-hostedzone.sh -e devops -z Z1YQCIKJK8P7ZS -r us-1

# Dev - Create 
aws cloudformation create-stack \
--stack-name aip-cloudfront-dev-master \
--template-body file://aip-cloudfront.cfn.json \
--parameters file://aip-cloudfront-dev-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM --disable-rollback \
--region us-east-1

## -- update Abbott AWS: Dev environment --
aws cloudformation update-stack \
--stack-name aip-cloudfront-dev-master \
--template-body file://aip-cloudfront.cfn.json \
--parameters file://aip-cloudfront-dev-launch-params-us-east-1.json \
--capabilities CAPABILITY_IAM \
--region us-east-1

## - Run CDN Fixup script after any create-stack or update-stack (avoids manual clicks, etc.)
##   Requires python 3 and AWS Boto3
python cdn-fix.py --Id XXX     #"Distribution Id" from cloudfront console page



########################################
# ------ Ireland EU-west-1 Region ------
########################################


# Prod






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
Deploy S3 Archive - ICP-2013 &  

Summary and Rollout Instructions

########################################################
ICP recap below:

--- ICP-2013 ---
For all Application buckets (1 ETL, 3 BI) implement the following design: 

1) In CFN, Add to each S3 bucket a SNS subscription on Put events that invokes Lambda and other subscribers such as bi-sqs-dataprocess queue 

2) In Lambda 
    a) test if the object being put has the SSE flag (x-amz-server-side-encryption) and if not, encrypt the object with Amazon SSE. 
    b) Copy the encrypted object to the archive bucket (ref. ICP-2726). 
    c) Set a S3 Lifecycle Policy that removes the file after 30 days. 

3) Peer review. 
4) Prepare for release including ICP-2726. 

--- ICP-2726 ---
Move files from ETL buckets to an archive bucket and then to long-term storage in Glacier.

AC:
1) S3 shall have bucket aip-s3-archive-{region}-{account}

2) Lambda function shall copy files from S3 buckets (see below) into aip-s3-archive-{REGION}-{ACCOUNT}/{SOURCE BUCKET}/{YEAR}/{MONTH}/{DAY}/{FILE}

bi-{ENV}-s3-etl-upload
bi-{ENV}-s3-data-benchmark
bi-{ENV}-s3-data-metaanalysis
bi-{ENV}-s3-dataprocess-fileuploads

3) Lambda function that is run every hour shall move files older than 24 hours from the source bucket to the archive bucket
 
4) S3 archive bucket shall have a lifecycle policy to archive to Glacier after 5 days

########################################################
	Rollout US-East-1 - N. Virginia
########################################################

Status: ICP-2726 Deployed
CFN Stack: None
Bucket created manually: aip-s3-archive-us-east-1-661072482170

Deployment Steps:

Optional: 
	Remove Stack: ETL-S3-Archival
	Save S3 data to a backup bucket 
	Deploy Stack: aip-archival-s3-bucket

ETL App CFN Stack: bi-etl-devops-master

### Note: Create the common Lambda function handler for S3-Archive by running the installer 
# script located in "aip-aws-devops/cfn-templates/aip-bi/lambda/archive-s3/" folder.
# (run once per region)
cd aip-bi/lambda/archive-s3/s3-archive-lambda.sh
./s3-archive-lambda.sh

# CD to the Deploy directory
cd ../../deploy/ICP-2013-S3Archive

# Move all $ENV bucket objects to the aip-devops-compost-us-east-1-661072482170 bucket. 
aws s3 mv s3://mybucket/ s3://mybucket2/ --recursive


## AWS BI App Resources #### AWS BI ETL App (BI-DataProcess) ##
# Deletes stacks: bi-etl-$ENV-master, bi-app-aws-resources-$ENV-master
# Delete Stack bash script: 
# ./delete-stacks.sh -e devops -r us-east-1
./1-delete-stacks.sh -e [devops|dev|test|qa|prod|prod2] -r us-east-1

# Note: verify stacks are deleted before executing the next step

# Create BI App Resources and ETL App
# ./create-stacks.sh -e devops -r us-east-1

./2-create-stacks.sh -e [devops|dev|test|qa|prod|prod2] -r us-east-1

#Manual Step - Add Lambda Topic subscriptions to each bucket in each environment (no api avaiable)
# 1) Goto Console for Lambda
# 2) Navigate to "Lambda > Functions > s3-copy2archive-lambda"
# 3) Select the "Triggers" Tab
# 4) Choose "Add Trigger"
# 5) Add the following topic subscription per environment:
	"bi-{Environment}-sns-etl-file-uploaded"
# 6) Verify invocation by dropping a bucket valid file to trigger the event. Locate the log event and find the file in the S3-Archive-{Region}-{AccountNo} bucket. Example: aip-s3-archive-us-east-1-661072482170


# Move back $ENV bucket objects from the aip-devops-compost-us-east-1-661072482170 bucket. 
aws s3 mv s3://mybucket/ s3://mybucket2/ --recursive

########################################################
	Rollout EU-West-1 - Ireland
########################################################

Status: ICP-2726 Deployed
Bucket with Lifecycle Policy --
	CFN Stack: aip-archival-s3-bucket
	Deployed: 2016-03-24 06:00:25 UTC-0700
	Created Bucket: aip-s3-archive-eu-west-1-661072482170

Lambda Function Not deployed
	Deploy via...




########################################################
	Rollout AP-NorthEast-1 - Tokyo
########################################################

Status: ICP-2726 Not Deployed. Nick is considering removing Tokyo prod until customers onboard.








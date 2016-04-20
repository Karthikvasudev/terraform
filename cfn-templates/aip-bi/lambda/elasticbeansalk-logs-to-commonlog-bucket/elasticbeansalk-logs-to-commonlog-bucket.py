from __future__ import print_function


import json
import boto3
import time
import datetime
import json
import boto3
import urllib
import string
from botocore.client import ClientError

s3 = boto3.resource('s3')
s3c = boto3.client('s3')

def lambda_handler(event, context):
    region = event['Records'][0]['awsRegion']
    print ("REGION :" + region)
    source_bucket = event['Records'][0]['s3']['bucket']['name']
   
    print ("BUCKET :" + source_bucket)
    src_bucket_instance = s3.Bucket(source_bucket)
    key = urllib.unquote_plus(event['Records'][0]['s3']['object']['key']).decode('utf8')
    print ("KEY :" + key)
    copy_src = source_bucket + '/' + key
    archival_bucket = 'logs-'+region+'-661072482170' # bucket to wich the logs are copied
    new_key_name = 'beanstalk/' + key
    s3.Object(archival_bucket, new_key_name).copy_from(CopySource=copy_src,ServerSideEncryption='AES256',)
    print('ARCHIVED :')
    return source_bucket
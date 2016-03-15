import boto3
import argparse
import sys

#Parse command line for CloudFront Distribution ID e.g., '--id EZU58BWOW6DG5'
parser = argparse.ArgumentParser(description='CloudFormation CloudFront missing features fixup tool.')
parser.add_argument('--Id', required=True, type=str, help='CloudFront Distribution Id')
args = parser.parse_args()

#distribution ID
distributionId = args.Id
#print distributionId


# CloudFront script to set distribution values due to gaps in CloudFormation as of 3/14/16
AipCfSecretName='X-Aip-Cf-Secret'
AipCfSecretValue='d02b857b-0750-4618-b6d9-f2605de34e18'
AipOrigin='api-'



# Let's use Amazon CloudFront
client = boto3.client('cloudfront')

# Get distributionConfiguration
distConfig = client.get_distribution_config(Id=distributionId)

#Set origin items not available via CloudFormation. Two origins - api and S3 bucket
quantity = distConfig["DistributionConfig"]["Origins"]["Quantity"]
for i in range(quantity): 
	print distConfig["DistributionConfig"]["Origins"]["Items"][i]["Id"]
	#Origin SSL Protocols
	distConfig["DistributionConfig"]["Origins"]["Items"][i]\
	["CustomOriginConfig"]["OriginSslProtocols"]["Quantity"] = 3
	distConfig["DistributionConfig"]["Origins"]["Items"][i]\
	["CustomOriginConfig"]["OriginSslProtocols"]["Items"] = ['TLSv1', 'TLSv1.1', 'TLSv1.2']
	print "SSL Protocols: ", distConfig["DistributionConfig"]["Origins"]["Items"][i]["CustomOriginConfig"]['OriginSslProtocols']
	#
	if distConfig["DistributionConfig"]["Origins"]["Items"][i]["Id"].startswith(AipOrigin):
		# Origin Custom Headers
		distConfig["DistributionConfig"]["Origins"]["Items"][i]\
		["CustomHeaders"]["Quantity"] = 1
		distConfig["DistributionConfig"]["Origins"]["Items"][i]\
		["CustomHeaders"]["Items"]  = [{'HeaderName': AipCfSecretName, 'HeaderValue': AipCfSecretValue}]
		#
		print "CustomHeaders: ", distConfig["DistributionConfig"]["Origins"]["Items"][i]["CustomHeaders"], "\n"


# Set gzip compression on all Cache Behaviors
# Default Cache 
distConfig["DistributionConfig"]["DefaultCacheBehavior"]["Compress"] = True
#print distConfig["DistributionConfig"]["DefaultCacheBehavior"]["Compress"], "\n"

quantity = distConfig["DistributionConfig"]["CacheBehaviors"]["Quantity"]
for i in range(quantity): 
	print "\n", distConfig["DistributionConfig"]["CacheBehaviors"]["Items"][i]["PathPattern"]
	#Origin SSL Protocols
	distConfig["DistributionConfig"]["CacheBehaviors"]["Items"][i]["Compress"] = True
	print distConfig["DistributionConfig"]["CacheBehaviors"]["Items"][i]


response = client.update_distribution( 
	Id=distributionId, 
	DistributionConfig=distConfig["DistributionConfig"],
	IfMatch=distConfig["ETag"])

#print(response)

sys.exit()


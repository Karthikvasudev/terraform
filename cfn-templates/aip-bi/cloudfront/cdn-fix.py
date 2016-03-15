import boto3

# CloudFront script to set distribution values due to gaps in CloudFormation as of 3/14/16
AipCfSecretName='X-Aip-Cf-Secret'
AipCfSecretValue='d02b857b-0750-4618-b6d9-f2605de34e18'
ApiOrigin='api-devops-us-1.aliniqbis.com'

#distribution ID
#DistId = 'E12XI3HQP4EA0D' #Andreas
DistId = 'EZU58BWOW6DG5' #Devops


# Let's use Amazon S3
client = boto3.client('cloudfront')


distConfig = client.get_distribution_config(Id=DistId)

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
	if distConfig["DistributionConfig"]["Origins"]["Items"][i]["Id"] == ApiOrigin:
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


response = client.update_distribution(Id=DistId, DistributionConfig=distConfig["DistributionConfig"], IfMatch=distConfig["ETag"])
print(response)




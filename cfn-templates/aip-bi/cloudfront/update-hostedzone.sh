#!/bin/bash

ENV=""
ZONE=""
REGION=""

while getopts ":e:r:z:h" opt; do
	case $opt in
		h)
			echo "Usage: $0 -e <env> -r <region e.g. 'us-1'> -z <zone id>"
			exit 0
			;;

		e)
			ENV=$OPTARG
			;;

		r)
			REGION=$OPTARG
			;;

		z)
			ZONE=$OPTARG
			;;

		:)
			echo "Requires -e <env>, -r <region e.g. 'us-1'> and -z <zone id>"
			exit 1
			;;

	esac
done

if [ -z $ZONE ] || [ -z $ENV ] || [ -z $REGION ]; then
	echo "Usage: $0 -e <env> -r <region e.g. 'us-1'> -z <zone id>"
	exit 1
fi

CHANGE_ELEMENT="{ \
  \"Comment\": \"Add environment-region CNAME pointing to CloudFront Distribution\", \
  \"Changes\": [ \
    { \
      \"Action\": \"UPSERT\", \
      \"ResourceRecordSet\": { \
        \"Name\": \"${ENV}-${REGION}.aliniqbis.com\", \
        \"Type\": \"CNAME\", \
        \"TTL\" : 900, \
        \"ResourceRecords\": [{\"Value\": \"cdn-${ENV}-${REGION}.aliniqbis.com\"}] \
      } \
    } \
  ] \
}"


#echo $CHANGE_ELEMENT > ./r53env-cdn.json


aws route53 change-resource-record-sets --hosted-zone-id $ZONE --change-batch "$CHANGE_ELEMENT"

ret=$?


exit $ret

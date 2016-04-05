#!/bin/bash

set -x

ENV=""
REGION=""

while getopts ":e:r:h" opt; do
	case $opt in
		h)
			echo "Usage: $0 -e <env> -r <region e.g. 'us-east-1'>"
			exit 0
			;;

		e)
			ENV=$OPTARG
			;;

		r)
			REGION=$OPTARG
			;;

		:)
			echo "Requires -e <env>, -r <region e.g. 'us-east-1'>"
			exit 1
			;;

	esac
done

if [ -z $ENV ] || [ -z $REGION ]; then
	echo "Usage: $0 -e <env> -r <region e.g. 'us-1'> -z <zone id>"
	exit 1
fi

DBI="bi-$ENV-rds-dw-$REGION"

aws rds create-db-snapshot --db-snapshot-identifier $DBI"-Release-1-1" --db-instance-identifier $DBI --region $REGION



ret=$?


exit $ret

# Change Log - aip-aws-devops repo - CloudFormatioin, Lambda, and other infrastructure automation

All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).


## [Unreleased]
### Added
- ICP-2879 Static Asset Website for CloudFront
- ICP-2013 S3 Encryption, archiving
### Changed
- Nginx health check from port 8080 to 80


## [2.2.0] - 2016-02-05
### Added
- ICP-2904 Proxy App Beanstalk Healthcheck
- ICP-2703 BI-App rename of CFN stack
- ICP-2862 AIP Health check
### Changed
- ICP-2702 BI-App CFN stack split into independant resources and application stacks
- ICP-2170 Beanstalk log rotation to S3 bucket


## [2.1.0] - 2016-01-28
### Added
- ICP-777 Ireland region (eu-west-1) Prod environment
- ICP-2904 Proxy App Beanstalk Healthcheck
- ICP-2331 CFN SNS-SQS integration for notifications: bounce, complain, delivery
### Changed
- ICP-2699 Beanstalk Solution Stack update and new MultiDocker AMI 2.0.6, Docker 1.7.1
- fix/ICP-2709 Nginx proxy plus for enabling proxy protocol policy on load balancer
- ICP-2820 Beanstalk Golden image changed to use ECR
- R53 Proxy IDs updated



## [2.0.0] - 2016-01-19
### Added
- ICP-1527 Private SSL added


## [1.0.0] - 2016-01-06
### Added
- ICP-772 Public SSL added to Proxy Application 
- ICP-2640 Elastic Container Registry (ECR) change from DTR
- Cumulative changes - see repo





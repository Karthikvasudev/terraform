# BIS Stack - Commands
# -------------------------------------

[us-east-1, devops]

	terraform remote config -backend=s3 \
		-backend-config="bucket=aip-config-us-east-1-661072482170" \
		-backend-config="key=terraform/bis-devops-us-east-1/bis-devops-us-east-1.tfstate" \
		-backend-config="region=us-east-1" \
		-backend-config="profile=aip-prod"

	terraform get -update=true ./bis

	terraform plan    -var 'profile=aip-prod' -var-file=./bis/bis-devops-us1/bis-devops-us1.tfvars ./bis

	terraform apply   -var 'profile=aip-prod' -var-file=./bis/bis-devops-us1/bis-devops-us1.tfvars ./bis

	terraform destroy -var 'profile=aip-prod' -var-file=./bis/bis-devops-us1/bis-devops-us1.tfvars ./bis



[us-east-1, dev]

	terraform remote config -backend=s3 \
		-backend-config="bucket=aip-config-us-east-1-661072482170" \
		-backend-config="key=terraform/bis-dev-us-east-1/bis-dev-us-east-1.tfstate" \
		-backend-config="region=us-east-1" \
		-backend-config="profile=aip-prod"

	terraform get -update=true ./bis

	terraform plan    -var 'profile=aip-prod' -var-file=./bis/bis-dev-us1/bis-dev-us1.tfvars ./bis

	terraform apply   -var 'profile=aip-prod' -var-file=./bis/bis-dev-us1/bis-dev-us1.tfvars ./bis

	terraform destroy -var 'profile=aip-prod' -var-file=./bis/bis-dev-us1/bis-dev-us1.tfvars ./bis



[us-east-1, test]

	terraform remote config -backend=s3 \
		-backend-config="bucket=aip-config-us-east-1-661072482170" \
		-backend-config="key=terraform/bis-test-us-east-1/bis-test-us-east-1.tfstate" \
		-backend-config="region=us-east-1" \
		-backend-config="profile=aip-prod"

	terraform get -update=true ./bis

	terraform plan    -var 'profile=aip-prod' -var-file=./bis/bis-test-us1/bis-test-us1.tfvars ./bis

	terraform apply   -var 'profile=aip-prod' -var-file=./bis/bis-test-us1/bis-test-us1.tfvars ./bis

	terraform destroy -var 'profile=aip-prod' -var-file=./bis/bis-test-us1/bis-test-us1.tfvars ./bis



[us-east-1, qa]

	terraform remote config -backend=s3 \
		-backend-config="bucket=aip-config-us-east-1-661072482170" \
		-backend-config="key=terraform/bis-qa-us-east-1/bis-qa-us-east-1.tfstate" \
		-backend-config="region=us-east-1" \
		-backend-config="profile=aip-prod"

	terraform get -update=true ./bis

	terraform plan    -var 'profile=aip-prod' -var-file=./bis/bis-qa-us1/bis-qa-us1.tfvars ./bis

	terraform apply   -var 'profile=aip-prod' -var-file=./bis/bis-qa-us1/bis-qa-us1.tfvars ./bis

	terraform destroy -var 'profile=aip-prod' -var-file=./bis/bis-qa-us1/bis-qa-us1.tfvars ./bis



[us-east-1, beta]

	terraform remote config -backend=s3 \
		-backend-config="bucket=aip-config-us-east-1-661072482170" \
		-backend-config="key=terraform/bis-beta-us-east-1/bis-beta-us-east-1.tfstate" \
		-backend-config="region=us-east-1" \
		-backend-config="profile=aip-prod"

	terraform get -update=true ./bis

	terraform plan    -var 'profile=aip-prod' -var-file=./bis/bis-beta-us1/bis-beta-us1.tfvars ./bis

	terraform apply   -var 'profile=aip-prod' -var-file=./bis/bis-beta-us1/bis-beta-us1.tfvars ./bis

	terraform destroy -var 'profile=aip-prod' -var-file=./bis/bis-beta-us1/bis-beta-us1.tfvars ./bis



[us-east-1, prod]

	terraform remote config -backend=s3 \
		-backend-config="bucket=aip-config-us-east-1-661072482170" \
		-backend-config="key=terraform/bis-prod-us-east-1/bis-prod-us-east-1.tfstate" \
		-backend-config="region=us-east-1" \
		-backend-config="profile=aip-prod"

	terraform get -update=true ./bis

	terraform plan    -var 'profile=aip-prod' -var-file=./bis/bis-prod-us1/bis-prod-us1.tfvars ./bis

	terraform apply   -var 'profile=aip-prod' -var-file=./bis/bis-prod-us1/bis-prod-us1.tfvars ./bis

	terraform destroy -var 'profile=aip-prod' -var-file=./bis/bis-prod-us1/bis-prod-us1.tfvars ./bis
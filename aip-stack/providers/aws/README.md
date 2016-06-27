# Admin Stack - Commands  
# -------------------------------------  

Commands that can be run from the 'admin' directory to create admin stack in respective environemnts

# Prod - admin-prod-us1

terraform remote config -backend=s3 \
	-backend-config="bucket=aip-config-us-east-1-661072482170" \
	-backend-config="key=terraform/admin-prod-us1/admin-prod-us1.tfstate" \
	-backend-config="region=us-east-1"

terraform get -update=true ./admin

terraform plan -var-file=./admin/admin-prod-us1/admin-prod-us1.tfvars ./admin

terraform apply -var-file=./admin/admin-prod-us1/admin-prod-us1.tfvars ./admin

terraform destroy -var-file=./admin/admin-prod-us1/admin-prod-us1.tfvars ./admin


# Sandbox - admin-dev-us1

terraform remote config -backend=s3 \
	-backend-config="bucket=aip-config-us-east-1-596978647277" \
	-backend-config="key=terraform/admin-dev-us1/admin-dev-us1.tfstate" \
	-backend-config="region=us-east-1"

terraform get -update=true ./admin

terraform plan  -var 'profile=sandbox' -var-file=./admin/admin-dev-us1/admin-dev-us1.tfvars ./admin

terraform apply -var 'profile=sandbox' -var-file=./admin/admin-dev-us1/admin-dev-us1.tfvars ./admin

terraform destroy -var 'profile=sandbox' -var-file=./admin/admin-dev-us1/admin-dev-us1.tfvars ./admin
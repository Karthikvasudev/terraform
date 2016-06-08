# Readme.md

# Prod - admin-prod-us1
terraform get -update=true 
terraform plan -var-file=./admin-prod-us1/admin-prod-us1.tfvars -state=./admin-prod-us1/admin-prod-us1.tfstate
terraform apply -var-file=./admin-prod-us1/admin-prod-us1.tfvars -state=./admin-prod-us1/admin-prod-us1.tfstate

# Sandbox - admin-dev-us1
terraform get -update=true 
terraform plan  -var 'profile=sandbox' -var-file=./admin-dev-us1/admin-dev-us1.tfvars -state=./admin-dev-us1/admin-dev-us1.tfstate 
terraform apply -var 'profile=sandbox' -var-file=./admin-dev-us1/admin-dev-us1.tfvars -state=./admin-dev-us1/admin-dev-us1.tfstate


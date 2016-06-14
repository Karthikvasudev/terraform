# Readme.md

# Prod - admin-prod-us1

terraform get -update=true ./admin

terraform plan -var-file=./admin-prod-us1/admin-prod-us1.tfvars -state=./admin-prod-us1/admin-prod-us1.tfstate ./admin

terraform apply -var-file=./admin-prod-us1/admin-prod-us1.tfvars -state=./admin-prod-us1/admin-prod-us1.tfstate ./admin

terraform distroy -var-file=./admin-prod-us1/admin-prod-us1.tfvars -state=./admin-prod-us1/admin-prod-us1.tfstate ./admin


# Sandbox - admin-dev-us1

terraform get -update=true ./admin

terraform plan  -var 'profile=sandbox' -var-file=./admin-dev-us1/admin-dev-us1.tfvars -state=./admin-dev-us1/admin-dev-us1.tfstate ./admin

terraform apply -var 'profile=sandbox' -var-file=./admin-dev-us1/admin-dev-us1.tfvars -state=./admin-dev-us1/admin-dev-us1.tfstate ./admin


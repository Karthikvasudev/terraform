# Admin Stack - Commands  
# -------------------------------------  

Commands that can be run from the 'admin' directory to create admin stack in respective environemnts

# Prod - admin-prod-us1

terraform get -update=true ./admin

terraform plan -var-file=./admin/admin-prod-us1/admin-prod-us1.tfvars -state=./admin/admin-prod-us1/admin-prod-us1.tfstate ./admin

terraform apply -var-file=./admin/admin-prod-us1/admin-prod-us1.tfvars -state=./admin/admin-prod-us1/admin-prod-us1.tfstate ./admin

terraform destroy -var-file=./admin/admin-prod-us1/admin-prod-us1.tfvars -state=./admin/admin-prod-us1/admin-prod-us1.tfstate ./admin


# Sandbox - admin-dev-us1

terraform get -update=true ./admin

terraform plan  -var 'profile=sandbox' -var-file=./admin/admin-dev-us1/admin-dev-us1.tfvars -state=./admin/admin-dev-us1/admin-dev-us1.tfstate ./admin

terraform apply -var 'profile=sandbox' -var-file=./admin/admin-dev-us1/admin-dev-us1.tfvars -state=./admin/admin-dev-us1/admin-dev-us1.tfstate ./admin

terraform destroy -var 'profile=sandbox' -var-file=./admin/admin-dev-us1/admin-dev-us1.tfvars -state=./admin/admin-dev-us1/admin-dev-us1.tfstate ./admin
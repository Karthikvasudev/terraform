# Readme.md

# Prod
terraform get -update=true 
terraform plan .
terraform apply .

# Sandbox 
terraform get -update=true 
terraform plan -var 'profile=sandbox' -var-file=sandbox.tfvars .
terraform apply -var 'profile=sandbox' -var-file=sandbox.tfvars .


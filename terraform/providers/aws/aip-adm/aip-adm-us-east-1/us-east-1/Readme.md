# Readme.md

# US-East-1
terraform plan  -var 'profile=default' -var-file=aip-adm-us-east-1.tfvars -state=aip-adm-us-east-1.tfstate 
terraform apply -var 'profile=default' -var-file=aip-adm-us-east-1.tfvars -state=aip-adm-us-east-1.tfstate 

# Sandbox 
terraform get -update=true 
terraform plan  -var 'profile=sandbox' -var-file=sandbox.tfvars -state=sandbox.tfstate 
terraform apply -var 'profile=sandbox' -var-file=sandbox.tfvars -state=sandbox.tfstate

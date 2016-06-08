# Readme.md

# AP-Northeast-1
terraform plan  -var 'profile=default' -var-file=aip-adm-ap-northeast-1.tfvars -state=aip-adm-ap-northeast-1.tfstate 
terraform apply -var 'profile=default' -var-file=aip-adm-ap-northeast-1.tfvars -state=aip-adm-ap-northeast-1.tfstate 

# EU-West-1
terraform plan  -var 'profile=default' -var-file=aip-adm-eu-west-1.tfvars -state=aip-adm-eu-west-1.tfstate 
terraform apply -var 'profile=default' -var-file=aip-adm-eu-west-1.tfvars -state=aip-adm-eu-west-1.tfstate 


# Sandbox 
terraform get -update=true 
terraform plan  -var 'profile=sandbox' -var-file=sandbox.tfvars -state=sandbox.tfstate 
terraform apply -var 'profile=sandbox' -var-file=sandbox.tfvars -state=sandbox.tfstate


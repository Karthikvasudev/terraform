# Joshua Stack - Commands
# -------------------------------------

# Infradev - joshua-infradev-us1

	terraform remote config -backend=s3 \
        -backend-config="bucket=aip-config-us-east-1-596978647277" \
        -backend-config="key=terraform/joshua-infradev-us1/joshua-infradev-us1.tfstate" \
        -backend-config="region=us-east-1" \
        -backend-config="profile=infradev"

	terraform get -update=true ./joshua

	terraform plan  -var 'profile=infradev' -var-file=./joshua/joshua-infradev-us1/joshua-infradev-us1.tfvars ./joshua

	terraform apply -var 'profile=infradev' -var-file=./joshua/joshua-infradev-us1/joshua-infradev-us1.tfvars ./joshua

	terraform destroy -var 'profile=infradev' -var-file=./joshua/joshua-infradev-us1/joshua-infradev-us1.tfvars ./joshua


# Prod - joshua-prod-us1

	terraform remote config -backend=s3 \
        -backend-config="bucket=aip-config-us-east-1-596978647277" \
        -backend-config="key=terraform/joshua-prod-us1/joshua-prod-us1.tfstate" \
        -backend-config="region=us-east-1" \
        -backend-config="profile=aip-prod"

	terraform get -update=true ./joshua

	terraform plan  -var 'profile=aip-prod' -var-file=./joshua/joshua-prod-us1/joshua-prod-us1.tfvars ./joshua

	terraform apply -var 'profile=aip-prod' -var-file=./joshua/joshua-prod-us1/joshua-prod-us1.tfvars ./joshua

	terraform destroy -var 'profile=aip-prod' -var-file=./joshua/joshua-prod-us1/joshua-prod-us1.tfvars ./joshua	
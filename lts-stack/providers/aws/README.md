# LTS Stack - Commands
# -------------------------------------

# Infradev - lts-infradev-us1

	terraform remote config -backend=s3 \
        -backend-config="bucket=aip-config-us-east-1-596978647277" \
        -backend-config="key=terraform/lts-infradev-us1/lts-infradev-us1.tfstate" \
        -backend-config="region=us-east-1" \
        -backend-config="profile=infradev"

	terraform get -update=true ./lts

	terraform plan  -var 'profile=infradev' -var-file=./lts/lts-infradev-us1/lts-infradev-us1.tfvars ./lts

	terraform apply -var 'profile=infradev' -var-file=./lts/lts-infradev-us1/lts-infradev-us1.tfvars ./lts

	terraform destroy -var 'profile=infradev' -var-file=./lts/lts-infradev-us1/lts-infradev-us1.tfvars ./lts


# Prod - lts-prod-us1

	terraform remote config -backend=s3 \
        -backend-config="bucket=aip-config-us-east-1-488832870725" \
        -backend-config="key=terraform/lts-prod-us1/lts-prod-us1.tfstate" \
        -backend-config="region=us-east-1" \
        -backend-config="profile=lts-prod"

	terraform get -update=true ./lts

	terraform plan  -var 'profile=lts-prod' -var-file=./lts/lts-prod-us1/lts-prod-us1.tfvars ./lts

	terraform apply -var 'profile=lts-prod' -var-file=./lts/lts-prod-us1/lts-prod-us1.tfvars ./lts

	terraform destroy -var 'profile=lts-prod' -var-file=./lts/lts-prod-us1/lts-prod-us1.tfvars ./lts

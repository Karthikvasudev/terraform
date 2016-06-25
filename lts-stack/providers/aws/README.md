# LTS Stack - Commands
# -------------------------------------

# InfraDev - lts-infradev-us1

terraform remote config -backend=s3 \
        -backend-config="bucket=aip-config-us-east-1-596978647277" \
        -backend-config="key=terraform/lts-infradev-us1/lts-infradev-us1.tfstate" \
        -backend-config="region=us-east-1"

terraform get -update=true ./lts

terraform plan  -var 'profile=sandbox' -var-file=./lts/lts-infradev-us1/lts-infradev-us1.tfvars ./lts

terraform apply -var 'profile=sandbox' -var-file=./lts/lts-infradev-us1/lts-infradev-us1.tfvars ./lts

terraform destroy -var 'profile=sandbox' -var-file=./lts/lts-infradev-us1/lts-infradev-us1.tfvars ./lts

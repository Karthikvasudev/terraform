# Must mention the below cluster name in the user-data-file too

cluster-name = "aip-adm-ecs-admin"

ami-id = "ami-8f7687e2"

instance-type = "t2.micro"

keypair-name = "aip-bi-adm-keys"

user-data-file = "ecs-cluster-user-data.txt"

vpc-id = "vpc-1d23ee79"

subnet-ids = "subnet-c098dfea,subnet-cae6c8f7"

azs = "us-east-1d,us-east-1e"

max-size = 2

min-size = 1

desired-capacity = 1

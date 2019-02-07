#Creation of VPC
module "vpc-with-subnets" {
source = "./modules/vpc"
}
/**
module "keypair" {
source = "./modules/keypair"
}
**/
module "webserver" {
source = "./modules/webserver"
}

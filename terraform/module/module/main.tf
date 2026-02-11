module "ec2" {
  source = "./module/main/EC2"
  webserver_ami =  var.webserver_ami 
  webserver_instance_type = "t3.micro"
  webserver_keyname = "linux2"
  webserver_disable_api_termination = false
  webserver_sg = module.vpc.webserversg
  webserver_subnetA = module.vpc.subnet_id


} 

module "vpc" {
  source =  "./module/main/VPC"
  vpc_cidr = "172.30.0.0/16"
  vpc_subnetA = "172.30.128.0/20"
  public_ip = true
  az = "us-east-1a"

}
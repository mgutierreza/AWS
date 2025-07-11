resource "aws_network_acl" "acl-proyecto" {
 
  vpc_id = var.vpc_id
  subnet_ids = [module.subnet.all_subnet_ids]

  tags = {
    Name = "${module.vpc.vpc_name}-nacl"
  }
  
}
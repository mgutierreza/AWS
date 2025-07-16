module "sg" {
  source = "./modulos/securitygroup"

  name_security_group        = "sg_server_test"
  description_security_group = "Creacion de grupo de seguridad para HTTP/HTTPS"
  vpc_id                     = data.aws_vpc.vpc-server-test.id

  name_security_group_alb        = "sg_server_test_alb"
  description_security_group_alb = "Grupo de seguridad para ALB"
}

module "ec2" {
  source = "./modulos/ec2"

  count = length(var.instance_configuration)

  ami_id      = data.aws_ami.amazon_linux.id
  server_name = join("0", ["server-test-", tostring(count.index)])

  subnet_id  = var.instance_configuration[count.index].subnet_id
  ip-privada = var.instance_configuration[count.index].ip_privada

  sg_id    = module.sg.sg_id
  kp_name  = data.aws_key_pair.existing_key.key_name
  rol_name = data.aws_iam_role.existing_role.name
}

module "alb" {
  source = "./modulos/alb"

  alb_name          = "ec2-alb"
  vpc_id            = data.aws_vpc.vpc-server-test.id
  instance_ids      = [for instance in module.ec2 : instance.instance_id]
  public_subnets_id = [for config in var.instance_configuration : config.subnet_id]
  sg_id             = module.sg.sg_id_alb
  target_group_arn = [for instance in module.ec2 : instance.instance_id]  
  #security_group_alb_id = module.sg.sg_id_alb
}


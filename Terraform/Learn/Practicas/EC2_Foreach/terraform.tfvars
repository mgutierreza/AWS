Virginia_cidr  = "10.10.0.0/16"
private_subnet = "10.10.0.0/24"
public_subnet  = "10.10.1.0/24"

tags = {
  "Ambiente"    = "QA"
  "Nube"        = "AWS"
  "IAC"         = "Terraform"
  "Responsable" = "MGA"
}

ec2_parametros = {
  "ami" = "ami-0a749d160bf052e89"
  "instance_type" = "t2.micro"
  "key_name" = "test-mga"
}

instancias = {
  "nombre01" = "WEB Server"
  "nombre02" = "APP Server"
  "nombre03" = "BD Server"
}
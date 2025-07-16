output "ec2-id" {
  value = module.ec2.instance_id
}

output "ec2-ip-publica" {
  value = module.ec2.public_ip
}

output "ec2-ip-privada" {
  value = module.ec2.private_ip
}
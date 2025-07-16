output "ec2_ids" {
  value = [for instance in module.ec2 : instance.instance_id]
}

output "ec2_ips_publicas" {
  value = [for instance in module.ec2 : instance.public_ip]
}

output "ec2_ips_privadas" {
  value = [for instance in module.ec2 : instance.private_ip]
}

output "ec2_arns" {
  value = [for instance in module.ec2 : instance.ec2_arn]
}
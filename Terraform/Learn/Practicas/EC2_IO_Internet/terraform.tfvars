Virginia_cidr  = "10.10.0.0/16"
private_subnet = "10.10.0.0/24"
public_subnet  = "10.10.1.0/24"

tags = {
  "Ambiente"    = "QA"
  "Nube"        = "AWS"
  "IAC"         = "Terraform"
  "Responsable" = "MGA"
}
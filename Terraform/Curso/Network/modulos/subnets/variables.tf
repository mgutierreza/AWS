variable "availabilityzone" {
  description = "Nombre de la zona de disponibilidad"
  type = object({
    azs1 = string,
    azs2 = string,
    azs3 = string
  })
  default = {
    azs1 = "us-west-1a",
    azs2 = "us-west-2a",
    azs3 = "us-west-3a"
  }  
}

variable "subnet-cidr" {
  description = "CIDR de las subnets"
  type = object({
    public_cidr_1A = string,
    public_cidr_1B = string,
    private_cidr_1A = string,
    private_cidr_1B = string,
    private_cidr_2A = string,
    private_cidr_2B = string
  })
  default = {
    public_cidr_1A = "10.10.1.0/24",
    public_cidr_1B = "10.10.2.0/24",
    private_cidr_1A = "10.10.3.0/24",
    private_cidr_1B = "10.10.4.0/24",
    private_cidr_2A = "10.10.5.0/24",
    private_cidr_2B = "10.10.6.0/24"
  }
}

variable "name_subnet" {
  description = "Nombre para identificar la Subnet"
  type = object({
    name_public_1A = string,
    name_public_1B = string,
    name_private_1A = string,
    name_private_1B = string,
    name_private_2A = string,
    name_private_2B = string
  })
  default = {
    name_public_1A = "subnet-pública-1A",
    name_public_1B = "subnet-pública-1B",
    name_private_1A = "subnet-privada-1A",
    name_private_1B = "subnet-privada-1B",
    name_private_2A = "subnet-privada-2A",
    name_private_2B = "subnet-privada-2B"    
  }
}


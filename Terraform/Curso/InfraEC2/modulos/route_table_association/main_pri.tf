resource "aws_route_table_association" "private_route_table_association"{
    
    route_table_id = var.rtb_id_public
    subnet_id = var.pri_subnet_id
}
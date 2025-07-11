resource "aws_route_table_association" "public_route_table_association"{
    
    route_table_id = var.rtb_id_public
    subnet_id = var.pub_subnet_id

}
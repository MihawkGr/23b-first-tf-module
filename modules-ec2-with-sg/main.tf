resource "aws_instance" "my_new_instance_1" {
    count = var.instance_count
    ami = var.ami
    instance_type = var.instance_type
    tags = {
        Name = "terraform_module_instance-${count.index +1}"
    }
    vpc_security_group_ids = [aws_security_group.web_sg.id]
}

resource "aws_security_group" "web_sg" {
    name = var.sg_name
    description = var.sg_description
    vpc_id = var.vpc_id

    ingress {
        description = "HTTP traffic over port 80"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

}
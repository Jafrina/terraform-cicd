resource "aws_security_group" "terra-sg" {
    name = "terrasg"
    description = "terrasg"
    vpc_id = "vpc-008657f03a593824a"

    ingress{
        description = "http inbund rules"
        protocol = "tcp"
        from_port = "22"
        to_port   =  "22"
        cidr_blocks = ["0.0.0.0/0"]
    }  
    ingress {
        description = "ssh inbund rules"
        protocol    =  "tcp"
        from_port    =  "80"
        to_port      =   "80"
        cidr_blocks   = ["0.0.0.0/0"]
    }
    egress {
        description = "out bund rules"
        protocol = "-1"
        from_port = "0"
        to_port    = "0"
        cidr_blocks  = ["0.0.0.0/0"]
    }
}


#EC2-Instances
resource "aws_instance" "terra-ec2" {
    ami      =   "ami-0b20a6f09484773af"
    instance_type = "t2.micro"
    key_name      =  "27-Apr-2024"
    subnet_id    =   "subnet-0b3c4909eb3a9d93c"
    associate_public_ip_address = true
#    availability_zone = "us-west-2"
    vpc_security_group_ids = [aws_security_group.terra-sg.id]
}


# Create ec2-slave in public subnet

resource "aws_instance" "ec2-slave" {
  ami           = "ami-08c40ec9ead489470"
  instance_type = "t2.micro"
  subnet_id = "subnet-02b8655dc450af96c"
  availability_zone = "us-east-1a"
  vpc_security_group_ids = [aws_security_group.allow_ssh_port_3000.id]
  associate_public_ip_address = true
  key_name = aws_key_pair.ec2_slave_pubkey.key_name

  tags = {
    Name = "ec2-slave"
  }


}



# Allow SSH from 0.0.0.0/0 & Open Port 3000
resource "aws_security_group" "allow_ssh_port_3000" {
  name        = "sec-grp-2"
  description = "Allow ssh and tcp on port 3000"
  vpc_id      = "vpc-0becd3cc533a2a4f1"

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]

  }

  ingress {
    description      = "TCP"
    from_port        = 3000
    to_port          = 3000
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]

  }


}


# Copy Public-Key to our EC2

resource "aws_key_pair" "ec2_slave_pubkey" {
  
  key_name = "ec2_slave"
  public_key = file("~/.ssh/bastionkey.pub")

}



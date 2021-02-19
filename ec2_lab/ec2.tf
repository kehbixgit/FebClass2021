resource "aws_instance" "Feb_Class2021" {
  ami = "ami-096fda3c22c1c990a"
  instance_type = "t2.micro"
  tags = {
      Name = "Feb_Class2021"
  }
  key_name = "ec2demo_1"
  user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum install -y httpd
                systemctl start httpd.service
                systemctl enable httpd.service
                echo "Hi Friend , I am $(hostname -f) hosted by Terraform" > /var/www/html/index.html
                EOF
}



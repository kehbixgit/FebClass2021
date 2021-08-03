resource "aws_instance" "june21class" {
  count = 2
  ami = "ami-096fda3c22c1c990a"
  instance_type = "t2.micro"
  tags = {
      Name = "j21class-${count.index}"
  }
  key_name = "CCA640-2019"
  user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum install -y httpd
                systemctl start httpd.service
                systemctl enable httpd.service
                echo "Hi Friend , I am $(hostname -f) hosted by Terraform" > /var/www/html/index.html
                EOF
}

# terraform state list
# terraform state show  > one of the list instance
# terraform destroy -target=aws_instance.ec2[1]

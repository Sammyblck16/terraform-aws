provider "aws" {
  region = "us-east-1"
  access_key = "AKIA5NQVY5XL7TECYVIF"
  secret_key = "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"
}
resource "aws_instance" "tfvm" {
  ami = "ami-0885b1f6bd170450c"
  instance_type = "t2.micro"
  #vpc_security_group_ids = [ aws_security_group.websg.id ]
  user_data = <<-EOF
                #!/bin/bash
                echo "I LOVE TERRAFORM" > index.html
                nohup busybox httpd -f -p 8080 &
                EOF
    tags = {
      Name = "WEB-demo"
    }
}

output "instance_ips" {
  value = aws_instance.tfvm.public_ip
}
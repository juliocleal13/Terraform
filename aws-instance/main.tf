provider "aws" {
  profile = "particular"
  region  = var.region
}

#resource "aws_s3_bucket" "bucket_terraform" {
#    bucket = "getting-started-guide"
#    acl = "private"
#}

#resource "aws_key_pair" "example" {
#    key_name = "defaultkey"
#    public_key = file("~/.ssh/id_rsa.pub")
#}

resource "aws_instance" "example" {
  ami           = var.amis[var.region]
  instance_type = "t2.micro"
  
  #connection {
  #    type = "ssh"
  #    user = "ec2-user"
  #    private_key = file("~/.ssh/id_rsa")
  #    host = self.public_ip
  #}

  #provisioner "local-exec" {
  #  command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
  #}
  
  #provisioner "remote-exec" {
  #  inline = [
  #      "sudo amazon-linux-extras enable nginx1.12",
  #      "sudo yum -y install nginx",
  #      "sudo systemctl start nginx"
  #  ]
  #}

  # depends_on = [aws_s3_bucket.bucket_terraform]
}

resource "aws_eip" "ip" {
    vpc = true
    instance = aws_instance.example.id
}
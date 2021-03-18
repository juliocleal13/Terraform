#Create portal aplicatoin machines

#Portal web load balancer node-1 - zone A
resource "aws_instance" "weblb1-zone-a" {
  #ami           = data.aws_ami.ubuntu.id
  ami           =  "ami-0c3c87b7d583d618f"
  availability_zone = "sa-east-1a"
  instance_type     = "m5.xlarge"
  key_name   = "softplan-${var.name}"
  subnet_id      = element(module.vpc.protected_subnets_ids, 0)
  security_groups = [module.vpc.security_group_softplan-protected_id]
  

  tags = {
    Name = "ec2-Softplan-weblb1-zone-a"
  }
}

resource "aws_ebs_volume" "weblb1-volume-zone-a" {
  #count         = 1
  availability_zone = "sa-east-1a"
  size              = 100
}

resource "aws_volume_attachment" "ebs_att_weblb1-volume-zone-a" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.weblb1-volume-zone-a.id
  instance_id = aws_instance.weblb1-zone-a.id
  
}


#Portal web load balancer node-2 - zone C
resource "aws_instance" "weblb2-zone-c" {
  ami           = "ami-0c3c87b7d583d618f"
  availability_zone = "sa-east-1c"
  instance_type     = "m5.xlarge"
  key_name   = "softplan-${var.name}"
  subnet_id      = element(module.vpc.protected_subnets_ids, 1)
  security_groups = [module.vpc.security_group_softplan-protected_id]
  

  tags = {
    Name = "ec2-Softplan-weblb2-zone-c"
  }
}

resource "aws_ebs_volume" "weblb2-volume-zone-c" {
  #count         = 1
  availability_zone = "sa-east-1c"
  size              = 100
}

resource "aws_volume_attachment" "ebs_att_weblb2-volume-zone-c" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.weblb2-volume-zone-c.id
  instance_id = aws_instance.weblb2-zone-c.id
  
}


#Portal web node-1 - zone A
resource "aws_instance" "web1-zone-a" {
  ami           = "ami-0c3c87b7d583d618f"
  availability_zone = "sa-east-1a"
  instance_type     = "m5.2xlarge"
  key_name   = "softplan-${var.name}"
  subnet_id      = element(module.vpc.protected_subnets_ids, 0)
  security_groups = [module.vpc.security_group_softplan-protected_id]
  

  tags = {
    Name = "ec2-Softplan-web1-zone-a"
  }
}

resource "aws_ebs_volume" "web1-volume-zone-a" {
  #count         = 1
  availability_zone = "sa-east-1a"
  size              = 100
}

resource "aws_volume_attachment" "ebs_att_weblb3-volume-zone-a" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.web1-volume-zone-a.id
  instance_id = aws_instance.web1-zone-a.id
  
}

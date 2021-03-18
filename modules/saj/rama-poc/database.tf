#database creation

#database 1 node-1 - zone A
resource "aws_instance" "database-zone-a" {
  ami           = "ami-050635a847834d247"
  availability_zone = "sa-east-1a"
  instance_type     = "m5.2xlarge"
  key_name   = "softplan-${var.name}"
  subnet_id      = element(module.vpc.protected_subnets_ids, 0)
  security_groups = [module.vpc.security_group_softplan-protected_id]
  

  tags = {
    Name = "ec2-Softplan-DB-zone-a"
  }
}

resource "aws_ebs_volume" "db-volume-zone-a" {
  #count         = 1
  availability_zone = "sa-east-1a"
  size              = 700
}

resource "aws_volume_attachment" "ebs_att_db-volume-zone-a" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.db-volume-zone-a.id
  instance_id = aws_instance.database-zone-a.id
  
}


#database 2 - node 2 - zone C
resource "aws_instance" "database-zone-c" {
  ami           = "ami-050635a847834d247"
  availability_zone = "sa-east-1c"
  instance_type     = "m5.2xlarge"
  key_name   = "softplan-${var.name}"
  subnet_id      = element(module.vpc.protected_subnets_ids, 1)
  security_groups = [module.vpc.security_group_softplan-protected_id]


  tags = {
    Name = "ec2-Softplan-DB-zone-c"
  }
}


resource "aws_ebs_volume" "db-volume-zone-c" {
  #count         = 1
  availability_zone = "sa-east-1c"
  size              = 700
}

resource "aws_volume_attachment" "ebs_att-db-volume-zone-c" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.db-volume-zone-c.id
  instance_id = aws_instance.database-zone-c.id
}

#database aux 1  - zone A
resource "aws_instance" "database-aux-zone-a" {
  ami           = "ami-0087fc03f28bcffd1"
  availability_zone = "sa-east-1a"
  instance_type     = "m5.large"
  key_name   = "softplan-${var.name}"
  subnet_id      = element(module.vpc.protected_subnets_ids, 0)
  security_groups = [module.vpc.security_group_softplan-protected_id]
  

  tags = {
    Name = "ec2-Softplan-DB-aux-zone-a"
  }
}

resource "aws_ebs_volume" "db-aux-volume-zone-a" {
  #count         = 1
  availability_zone = "sa-east-1a"
  size              = 250
}

resource "aws_volume_attachment" "ebs_att_db-aux-volume-zone-a" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.db-aux-volume-zone-a.id
  instance_id = aws_instance.database-aux-zone-a.id
  
}


#database aux2 - node 2 - zone C
resource "aws_instance" "database-aux-zone-c" {
  ami           = "ami-0087fc03f28bcffd1"
  availability_zone = "sa-east-1c"
  instance_type     = "m5.2xlarge"
  key_name   = "softplan-${var.name}"
  subnet_id      = element(module.vpc.protected_subnets_ids, 1)
  security_groups = [module.vpc.security_group_softplan-protected_id]


  tags = {
    Name = "ec2-Softplan-DB-aux-zone-c"
  }
}


resource "aws_ebs_volume" "db-aux-volume-zone-c" {
  #count         = 1
  availability_zone = "sa-east-1c"
  size              = 700
}

resource "aws_volume_attachment" "ebs_att-db-aux-volume-zone-c" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.db-aux-volume-zone-c.id
  instance_id = aws_instance.database-aux-zone-c.id
}
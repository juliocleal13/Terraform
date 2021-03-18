resource "aws_security_group" "postgresql" {
  vpc_id = var.vpc_id

  ingress {
        from_port = 5432
        to_port   = 5432
        protocol  = "TCP"
        cidr_blocks      = ["0.0.0.0/0"]
  }
}
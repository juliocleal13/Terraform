resource "aws_db_instance" "saj" {
  allocated_storage       = var.size
  storage_type            = "gp2"
  engine                  = "postgres"
  instance_class          = "db.t2.micro"
  name                    = var.dbname #lower("${var.name}")
  username                = var.username
  password                = var.password
  db_subnet_group_name    = aws_db_subnet_group.rds.id
  vpc_security_group_ids  = [aws_security_group.postgresql.id]
  skip_final_snapshot     = var.skip_final_snapshot
  identifier              = lower("rds-${var.name}")

  tags = var.tags
}

resource "aws_db_subnet_group" "rds" {
  name        = lower("${var.name}-${var.dbname}")
  subnet_ids  = var.private_subnets
  tags        = var.tags
}
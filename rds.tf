resource "aws_db_subnet_group" "rds_subnet" {
  name        = "rds_subnet"
  description = "rds_subnet"
  subnet_ids  = [aws_subnet.tf_private_subnet_1a.id, aws_subnet.tf_private_subnet_1c.id]
}

resource "aws_db_parameter_group" "mysql80" {
  name        = "mysql80"
  family      = "mysql8.0"
  description = "mysql80"
}

resource "aws_db_option_group" "mysql80" {
  name                     = "mysql80"
  option_group_description = "mysql80"
  engine_name              = "mysql"
  major_engine_version     = "8.0"
}

resource "aws_db_instance" "rds" {
  identifier              = "awsandinfradb"
  # storage size
  allocated_storage       = 20
  storage_type            = "gp2"
  engine                  = "mysql"
  engine_version          = "8.0.15"
  instance_class          = "db.t2.micro"
  name                    = "awsandinfradb"
  username                = "root"
  password                = "password"
  multi_az                = "false"
  db_subnet_group_name    = aws_db_subnet_group.rds_subnet.name
  parameter_group_name    = aws_db_parameter_group.mysql80.name
  option_group_name       = aws_db_option_group.mysql80.name
  vpc_security_group_ids  = [aws_security_group.allow_db.id]
  availability_zone       = aws_subnet.tf_private_subnet_1a.availability_zone
  port                    = 3306
  # backup_retention_period = 30
  skip_final_snapshot     = true

}
# creating the elastic file systemc and it mount targets
resource "aws_efs_file_system" "efs" {
  creation_token = "${var.name}-${var.environment_type}-nfs"

  tags = merge(var.default_tags, tomap({ Name = "${var.name}-${var.environment_type}-efs" }))
}

# Add mount target for the web01 subnet
resource "aws_efs_mount_target" "efs_mount_target01" {
  file_system_id = aws_efs_file_system.efs.id
  subnet_id = aws_subnet.web01.id
  security_groups = [aws_security_group.sg_efs.id]
}

# Add mount target for the web02 subnet
resource "aws_efs_mount_target" "efs_mount_target02" {
  file_system_id = aws_efs_file_system.efs.id
  subnet_id = aws_subnet.web02.id
  security_groups = [aws_security_group.sg_efs.id]
}
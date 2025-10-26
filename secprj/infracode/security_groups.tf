resource "aws_security_group" "wazuh_sg" {
  name        = "wazuh-sg"
  description = "Security group for Wazuh server"
  vpc_id      = aws_vpc.hybrid_vpc.id

  # --- Ingress Rules ---
  # Allow SSH from your home/VPN only
  ingress {
    description = "SSH from home IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["<YOUR_HOME_IP>/32"] # replace with your IP

  }

resource "aws_security_group" "wazuh_sg" {
	name = "wazuh-data"

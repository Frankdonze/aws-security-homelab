
resource "aws_instance" "wazuhvl" {
	ami = "ami-0360c520857e3138f"
	instance_type = "t3.medium"
	associate_public_ip_address = false
	subnet_id = "subnet-002a1fe6a629c6c53"
	private_ip = "10.20.1.10"
	
	vpc_security_group_ids = [
		"sg-083ac5fe66703651f",
		"sg-0018db6f78aa046e9",
		"sg-0fd76a5fd1c5f6fff",
		"sg-0946d0a5f16b2565b"
]

	root_block_device {
		volume_size = 25
		volume_type = "gp3"
		delete_on_termination = false
	
	}

	key_name = "sshkey"
	
	tags = {
	Name = "wazuhvl"




}
}

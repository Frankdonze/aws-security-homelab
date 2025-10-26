provider "aws" {
	region = "us-east-1"
}

resource "aws_instance" "wazuh"
	ami = "ami-0360c520857e3138f"
	instance_type = "t3.large"

	key_name = "sshkey"
	
	tags = {
	name = "SIEMVLWAZUH"




}
}

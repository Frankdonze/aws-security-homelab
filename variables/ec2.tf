#----provider config----
provider "aws" {
        region = "us-east-1"
}

#----launch EC2 instance----
resource "aws_instance" "my_ec2" {
        ami = "ami-00ca32bbc84273381"
        instance_type = "t2.nano"


        key_name = "sshkey"


        tags = {
        name = "First-TF-Server"
}
}


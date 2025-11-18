provider "aws" {
    region = "ap-south-1"
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key

}

resource "aws_instance" "Jenkins_server" {
    ami           = "ami-02b8269d5e85954ef"
    instance_type = "m7i-flex.large"
    key_name = "docker-key"
    vpc_security_group_ids = ["sg-06c8e6845b538d3e6"]
    subnet_id = "subnet-00241db97157a7462"
    associate_public_ip_address = true
   
    user_data = file("jenkins-installation.sh")
 

    tags = {
        Name = "Main-Server"
    
    }
}

output "public_ip" {
    value = aws_instance.Jenkins_server.public_ip
}


provider "aws" {
    region = "ap-south-1"
    
}

resource "aws_instance" "Jenkins_server" {
    ami           = "ami-02b8269d5e85954ef"
    instance_type = "t3.micro"
    key_name = ["Docker-key"]
    associate_public_ip_address = true
   

    tags = {
        Name = "ExampleInstance"
    }
}

user_data = 
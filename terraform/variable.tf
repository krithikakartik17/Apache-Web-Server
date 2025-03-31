variable "os" {
    type = string
    default = "ami-04b4f1a9cf54c11d0"
    description = "This is my AMI ID"
}

variable "size" {
    default = "t2.micro"
}

variable "name" {
    default = "Apache web server"
}

variable "nsg" {
    default = "web-server-nsg"
}
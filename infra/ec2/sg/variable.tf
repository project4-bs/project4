variable "http_port" {
    type = number
    description = "The port will use for HTTP requests"
    default = 80
}

variable "jenkins_port" {
    type = number
    default = 8080
}

variable "https_port" {
    type = number
    description = "The port will use for HTTPS requests"
    default = 443
}

variable "ssh_port" {
    type = number
    description = "The port will use for SSH requests"
    default = 22
}
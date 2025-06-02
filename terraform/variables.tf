variable "accountid" {
  description = "Harness account ID"
  type = string
}

variable "apikey" {
  description = "Harness API key"
  type        = string
}

variable "org" {
  description = "Organization ID"
  type        = string
  default = "DevX"
}


variable "project" {
    description = "Project ID"
    type =  string
    default = "devx"
}


variable "connectorRef" {
    description = "dockerhub connector"
    type = string 
    default = "account.<replace>" 
}


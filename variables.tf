variable "vm_count" {
  type        = number
  description = "This will define the amount of virtual machines there will be created."
}

variable "default_location" {
  type        = string
  description = "This will be your default location for your resources that will be created."
  default     = "westeurope"
}

variable "projName" {
  type        = string
  description = "This will be the main name in all your resources, keep in mind this name will change depending on what resource is being created."
}


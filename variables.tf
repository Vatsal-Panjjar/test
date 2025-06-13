variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
  default     = "example-resource-group"
}

variable "location" {
  description = "Azure location for the resources"
  type        = string
  default     = "Central India"
}

variable "vm_name" {
  description = "Name of the Virtual Machine"
  type        = string
  default     = "example-vm"
}

variable "vm_size" {
  description = "Size of the Azure Virtual Machine"
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "azureuser"
}

variable "admin_password" {
  description = "Admin password for the VM"
  type        = string
  sensitive   = true
}

variable "os_disk_name" {
  description = "Name of the OS disk"
  type        = string
  default     = "example-os-disk"
}

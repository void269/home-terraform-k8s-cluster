variable "vsphere_user" {
  description = "The vSphere user to connect to the vSphere server"
  type        = string
  default     = "administrator@vsphere.local"
}

variable "vsphere_password" {
  description = "The vSphere password to connect to the vSphere server"
  type        = string
  sensitive   = true
}

variable "vsphere_server" {
  description = "The vSphere server to connect to"
  type        = string
  default     = "vcsa-prod02.voidnet.com"
}

variable "vsphere_compute_cluster_name" {
  description = "The name of the vSphere compute cluster to use"
  type        = string
  default     = "Prod"
}

variable "vsphere_datacenter" {
  description = "The name of the vSphere datacenter to use"
  type        = string
  default     = "Datacenter"
}
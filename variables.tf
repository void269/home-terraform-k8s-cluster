variable "control_plane_count" {
  description = "Number of Kubernetes control plane nodes"
  type        = number
  default     = 1
}

variable "worker_count" {
  description = "Number of Kubernetes worker nodes"
  type        = number
  default     = 2
}

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

variable "Datastore_Cluster" {
  description = "The name of the vSphere datastore cluster to use"
  type        = string
  default     = "DatastoreCluster"
}

variable "vsphere_network" {
  description = "The name of the vSphere network to use"
  type        = string
  default     = "VM Network"
}

variable "vm_template_name" {
  description = "The name of the vSphere VM template to use"
  type        = string
  default     = "ubuntu-26-04-template"
}

variable "domain_name" {
  description = "The domain name to use for the cluster"
  type        = string
  default     = "voidnet.com"
}

variable "dns_suffixes" {
  description = "The DNS suffixes to use for the cluster"
  type        = list(string)
  default     = ["voidnet.com"]
}

variable "dns_servers" {
  description = "The DNS servers to use for the cluster"
  type        = list(string)
  default     = ["10.0.1.2", "10.0.1.100", "8.8.8.8"]
}

variable "netmask" {
  description = "The netmask to use for the cluster"
  type        = string
  default     = "24"
}

variable "gateway_ip" {
  description = "The gateway IP address to use for the cluster"
  type        = string
  default     = "10.0.1.1"
}

variable "phpipam_url" {
  description = "Base URL of the IPAM server"
  type        = string
  default     = "https://ipam-prod01.voidnet.com"
}

variable "phpipam_app_id" {
  description = "IPAM API application ID"
  type        = string
  default     = "terraform"
}

variable "phpipam_subnet_id" {
  description = "IPAM subnet ID used for Kubernetes VM address allocation"
  type        = number
  default     = 7
}

variable "phpipam_username" {
  description = "IPAM API username"
  type        = string
  default     = "admin"
}

variable "phpipam_password" {
  description = "IPAM API password"
  type        = string
  sensitive   = true
}
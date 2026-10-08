provider "vsphere" {
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
  
}

provider "phpipam" {
  app_id   = var.phpipam_app_id
  endpoint = "${var.phpipam_url}/api"
  username = var.phpipam_username
  password = var.phpipam_password
  insecure = false
}
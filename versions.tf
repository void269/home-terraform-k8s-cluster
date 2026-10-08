terraform {
  required_providers {
    vsphere = {
      source  = "vmware/vsphere"
      version = "2.17.1"
    }
    phpipam = {
      source  = "lord-kyron/phpipam"
      version = "1.7.0"
    }
  }
}
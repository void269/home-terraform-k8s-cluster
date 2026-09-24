data "vsphere_datacenter" "dc" {
  name = var.vsphere_datacenter
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.vsphere_compute_cluster_name
  datacenter_id = data.vsphere_datacenter.dc.id
}